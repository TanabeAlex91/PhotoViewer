//
//  AppearanceManager.swift
//  PhotoViewer
//
//  Created by Tanabe, Alex on 11/16/16.
//  Copyright © 2016 Alex Tanabe. All rights reserved.
//

import UIKit

class GlobalAppearanceManager {
    
    static func setupAppearance() -> Void {
        GlobalAppearanceManager.setupNavigationBarAppearance()
    }
    
    static func setupNavigationBarAppearance() -> Void {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.barTintColor = UIColor.cpOrange
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
}
