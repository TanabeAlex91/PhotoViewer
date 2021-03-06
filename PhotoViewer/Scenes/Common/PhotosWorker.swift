//
//  PhotosWorker.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/13/16.
//  Copyright (c) 2016 Alex Tanabe. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import Alamofire
import SwiftyJSON

let apiKey = "c72148b6364a09ee78e7868021dd29b4"

class FlickrPhotosWorker {
    
    var currentPage = 0
    
    func searchPhotosForTerm(_ searchTerm: String, completion : @escaping (_ results: ViewPhotos.SearchPhotos.SearchResults?, _ error : NSError?) -> Void){
        
        guard let searchURL = flickrSearchURLStringForSearchTerm(searchTerm) else {
            completion(nil, ErrorFactory.createMalformedURLError())
            return
        }
        
        Alamofire.request(searchURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let resultJSON = JSON(value)
                
                guard let status = resultJSON["stat"].string else {
                    completion(nil, ErrorFactory.createServiceError())
                    return
                }
                
                if status == "ok" {
                    var photos = [Photo]()
                    
                    for (_,photoJSON):(String, JSON) in resultJSON["photos"]["photo"] {
                        
                        guard let photoID = photoJSON["id"].string,
                            let farm = photoJSON["farm"].int ,
                            let server = photoJSON["server"].string ,
                            let secret = photoJSON["secret"].string else {
                                break
                        }
                        
                        let photo = Photo(photoID: photoID, farm: farm, server: server, secret: secret)
                        photos.append(photo)
                    }
                    
                    completion(ViewPhotos.SearchPhotos.SearchResults(searchTerm: searchTerm, resultPhotos: photos), nil)
                } else {
                    completion(nil, ErrorFactory.createServiceError())
                }
            case .failure:
                completion(nil, ErrorFactory.createServiceError())
            }
        }
    }
    
    func loadSourceImageWithURLString(_ urlString: String, completion : @escaping (_ sourceImage: UIImage?, _ error : NSError?) -> Void) {
        
        if let cachedImage = ImageCacheManager.sharedInstance.fetchImageWithIdentifier(urlString) {
            completion(cachedImage, nil)
        } else {
            let sourceImageURL = URL(string: urlString)!
            Alamofire.request(sourceImageURL).responseData { response in
                switch response.result {
                case .success:
                    if let imageData = response.data,
                        let photoImage = UIImage(data: imageData) {
                        completion(photoImage, nil)
                        ImageCacheManager.sharedInstance.addImage(photoImage, forIdentifier:urlString)
                    } else {
                        let error = ErrorFactory.createErrorWithReason("Oh Snap!", description: "An error ocurred while loading this image!")
                        completion(nil, error)
                    }
                case .failure:
                    completion(nil, ErrorFactory.createServiceError())
                }
                
            }
        }
    }
    
    fileprivate func flickrSearchURLStringForSearchTerm(_ searchTerm:String) -> String? {
        
        guard let escapedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) else {
            return nil
        }
        
        let URLString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(escapedTerm)&per_page=20&format=json&nojsoncallback=1&page=\(currentPage)"
        
        return URLString
    }
}
