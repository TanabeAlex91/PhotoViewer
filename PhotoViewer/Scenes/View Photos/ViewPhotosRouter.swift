//
//  ViewPhotosListRouter.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/12/16.
//  Copyright (c) 2016 Alex Tanabe. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ViewPhotosRouterInput {
    func showAlertForError(_ error: NSError)
    func showDetailScreenForPhoto(_ photo: Photo)
}

class ViewPhotosRouter: ViewPhotosRouterInput {
    weak var viewController: ViewPhotosViewController!
    
    // MARK: - Navigation
    
    func showAlertForError(_ error: NSError) {
        let alertController = AlertFactory.createAlertWithError(error)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func showDetailScreenForPhoto(_ photo: Photo) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewPhotoDetailViewController = storyboard.instantiateViewController(withIdentifier: "ViewPhotoDetailViewController") as! ViewPhotoDetailViewController
        viewPhotoDetailViewController.displayedPhoto = photo
        viewController.present(viewPhotoDetailViewController, animated: true, completion: nil)
    }
}
