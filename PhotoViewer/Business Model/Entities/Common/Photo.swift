//
//  Photo.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/13/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit

class Photo : Equatable {
    
    let photoID : String
    
    var thumbnail : UIImage?
    var sourceImage : UIImage?
    
    init (photoID:String) {
        self.photoID = photoID
    }
}

func == (lhs: Photo, rhs: Photo) -> Bool {
    return lhs.photoID == rhs.photoID
}
