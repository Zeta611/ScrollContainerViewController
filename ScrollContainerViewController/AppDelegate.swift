//
//  AppDelegate.swift
//  ScrollContainerViewController
//
//  Created by Jaeho Lee on 28/08/2019.
//  Copyright © 2019 Jay Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    -> Bool
  {
    window = UIWindow()
    window?.rootViewController = ContainerViewController()
    window?.makeKeyAndVisible()
    return true
  }
}

