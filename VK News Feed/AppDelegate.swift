//
//  AppDelegate.swift
//  VK News Feed
//
//  Created by Roman Rakhlin on 09.02.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import VKSdkFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AuthServiceDelegate {

    var window: UIWindow?
    var authService: AuthService!

    static func shared() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        self.authService = AuthService()

        authService.delegate = self

        let scope = ["wall", "friends"]

        VKSdk.wakeUpSession(scope) { (state, _) in
            if state == VKAuthorizationState.authorized {
                self.authServiceSignIn()
            } else {
                self.authVC()
            }
        }

        return true
    }

    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        return true
    }

    // MARK: AuthServiceDelegate
    func authServiceShouldShow(_ viewController: UIViewController) {
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }

    //login view NewsfeedViewcontroller
    func authServiceSignIn() {
        print(#function)
        let feedVC: NewsfeedViewController = NewsfeedViewController.loadFromStoryboard()
        let navVC = UINavigationController(rootViewController: feedVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    //view AuthViewController
    func authVC() {
        print(#function)
        let authVC: AuthViewController = AuthViewController.loadFromStoryboard()
        let navVC = UINavigationController(rootViewController: authVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    func authServiceDidSignInFail() {
        print(#function)
    }
}
