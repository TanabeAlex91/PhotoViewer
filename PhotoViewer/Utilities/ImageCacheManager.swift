//
//  ImageCacheManager.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/16/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import AlamofireImage

class ImageCacheManager {
    
    // MARK: - Object Lifecycle
    static let sharedInstance = ImageCacheManager()
    
    private init () {}
    
    private let imageCache = AutoPurgingImageCache()
    
    func addImage(_ image : UIImage, forIdentifier identifier : String) -> Void {
        guard imageCache.image(withIdentifier: identifier) != nil else {
            imageCache.add(image, withIdentifier: identifier)
            return
        }
    }
    
    func fetchImageWithIdentifier(_ identifier : String) -> UIImage? {
        return imageCache.image(withIdentifier: identifier)
    }
}
