//
//  AppDelegate.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit
import Network

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = LaunchScreenRouter()
        
        self.window = self.window ?? UIWindow()
        self.window!.rootViewController = controller.setup()
        self.window!.makeKeyAndVisible()

        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if(path.status == .satisfied) {
                NotificationCenter.default.post(name: .ConnectChanged, object: true)
            }
            else{
                NotificationCenter.default.post(name: .ConnectChanged, object: false)
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)

        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

