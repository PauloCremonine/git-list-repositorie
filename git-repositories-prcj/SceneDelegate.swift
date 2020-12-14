//
//  SceneDelegate.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let controller = LaunchScreenRouter()
        
        self.window = self.window ?? UIWindow()
        self.window!.rootViewController = controller.setup()
        self.window!.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

