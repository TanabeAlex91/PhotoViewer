//
//  AppDelegate.swift
//  PhotoViewer
//
//  Created by Alex Tanabe on 11/12/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GlobalAppearanceManager.setupAppearance()
        return true
    }
}

