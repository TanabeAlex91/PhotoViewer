//
//  PhotosModel.swift
//  PhotoViewer
//
//  Created by Tanabe, Alex on 11/15/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit

enum PhotoSize: Character {
    case source = "b"
    case thumbnail = "m"
}

struct Photo : Equatable {
    
    let photoID : String
    let farm : Int
    let server : String
    let secret : String
    
    init (photoID: String, farm: Int, server: String, secret: String) {
        self.photoID = photoID
        self.farm = farm
        self.server = server
        self.secret = secret
    }
    
    func imageURLString(_ size: PhotoSize = .thumbnail) -> String {
        return "https://farm\(self.farm).staticflickr.com/\(self.server)/\(self.photoID)_\(self.secret)_\(size.rawValue).jpg"
    }
    
    func imageURL(_ size:PhotoSize = .thumbnail) -> URL? {
        return URL(string: self.imageURLString(size))
    }
}

func == (lhs: Photo, rhs: Photo) -> Bool {
    return lhs.photoID == rhs.photoID
}
