//
//  ViewPhotoDetailInteractor.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/16/16.
//  Copyright (c) 2016 Alex Tanabe. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ViewPhotoDetailInteractorInput
{
  func doSomething(request: ViewPhotoDetail.Something.Request)
}

protocol ViewPhotoDetailInteractorOutput
{
  func presentSomething(response: ViewPhotoDetail.Something.Response)
}

class ViewPhotoDetailInteractor: ViewPhotoDetailInteractorInput
{
  var output: ViewPhotoDetailInteractorOutput!
  var worker: FlickrPhotosWorker!
  
  // MARK: - Business logic
  
  func doSomething(request: ViewPhotoDetail.Something.Request)
  {
    // NOTE: Create some Worker to do the work
    
    
    // NOTE: Pass the result to the Presenter
    
    let response = ViewPhotoDetail.Something.Response()
    output.presentSomething(response: response)
  }
}