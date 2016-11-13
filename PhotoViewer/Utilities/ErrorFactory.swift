//
//  ErrorFactory.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/13/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit

let defaultErrorDomain = "Photo Service Error"
let defaultErrorCode = 0

class ErrorFactory: NSObject {
    static func createErrorWithReason(_ reason: String, description: String) -> NSError {
        let userInfo = [NSLocalizedFailureReasonErrorKey: reason,
                        NSLocalizedDescriptionKey: description]
        
        let error = NSError(domain: defaultErrorDomain, code: defaultErrorCode, userInfo: userInfo)
        return error
    }
    
    static func createServiceError() -> NSError {
        return ErrorFactory.createErrorWithReason("Service Error", description: "Dang! It appears that the service call was not executed successfuly. Try again later =(")
    }
    
    static func createMalformedURLError() -> NSError {
        return ErrorFactory.createErrorWithReason("Wrong URL", description: "Woops, that's on me! The request URL was not generated correctly.")
    }
}
