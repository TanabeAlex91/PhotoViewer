//
//  ImageCacheManager.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/16/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit
import AlamofireImage

class ImageCacheManager: NSObject {
    
    // MARK: - Object Lifecycle
    static let sharedInstance = ImageCacheManager()
    
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
