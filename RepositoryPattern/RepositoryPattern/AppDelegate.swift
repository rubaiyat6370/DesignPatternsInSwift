//
//  AppDelegate.swift
//  RepositoryPattern
//
//  Created by Rubaiyat Jahan Mumu on 2020-02-10.
//  Copyright © 2020 Rubaiyat Jahan Mumu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = MainViewController(nibName: "MainViewController", bundle: nil)
        let navigationVC = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }

}

