//
//  FlickrPhoto.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/13/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit
import Alamofire

enum FlickrPhotoSize: Character {
    case source = "b"
    case thumbnail = "m"
}

class FlickrPhoto : Photo {
    
    let farm : Int
    let server : String
    let secret : String
    
    init (photoID: String, farm: Int, server: String, secret: String) {
        self.farm = farm
        self.server = server
        self.secret = secret
        
        super.init(photoID: photoID)
    }
    
    func imageURL(_ size:FlickrPhotoSize = .thumbnail) -> String {
        return "https://farm\(self.farm).staticflickr.com/\(self.server)/\(self.photoID)_\(self.secret)_\(size).jpg"
    }
    
    func loadSourceImage(_ completion: @escaping (_ photo:FlickrPhoto, _ error: NSError?) -> Void) {
        let sourceImageURL = self.imageURL(.source)
        
        Alamofire.request(sourceImageURL).responseData { response in
            
            switch response.result {
                
            case .success:
                if let data = response.result.value {
                    let sourceImage = UIImage(data: data)
                    self.sourceImage = sourceImage
                    completion(self, nil)
                }
                
            case .failure:
                completion(self, ErrorFactory.createServiceError())
                
            }
        }
    }
}

struct FlickrSearchResults {
    let searchTerm : String
    let searchResults : [Photo]
}
