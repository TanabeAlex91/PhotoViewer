//
//  AlertFactory.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/13/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit

class AlertFactory {
    static func createAlertWithError(_ error: NSError) -> UIAlertController {
        let alertController = UIAlertController(title: error.localizedFailureReason,
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        return alertController
    }
}
