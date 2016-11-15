//
//  ViewPhotosListPresenter.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/12/16.
//  Copyright (c) 2016 Alex Tanabe. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ViewPhotosPresenterInput {
    func presentPhotosFromSearch(response: ViewPhotos.SearchPhotos.Response)
}

protocol ViewPhotosPresenterOutput: class {
    func displayPhotoSearchServiceError(_ error : NSError)
    func displayResultsFromSearch(_ searchResults : ViewPhotos.SearchPhotos.SearchResults)
}

class ViewPhotosPresenter: ViewPhotosPresenterInput {
    weak var output: ViewPhotosPresenterOutput!
    
    // MARK: - Presentation logic
    
    func presentPhotosFromSearch(response: ViewPhotos.SearchPhotos.Response) {
        if let error = response.error {
            self.output.displayPhotoSearchServiceError(error)
            return
        } else if let results = response.searchResults {
            self.output.displayResultsFromSearch(results)
        }
    }
}