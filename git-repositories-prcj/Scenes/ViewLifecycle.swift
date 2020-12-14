//
//  ViewLifecycle.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol ViewLifecycle: AnyObject {
    func navigationMain(vc: UIViewController, animated: Bool)
    func present(_ vc: UIViewController, animated: Bool)
    func pop(animated: Bool)
    func dismiss(animated: Bool)
}

extension ViewLifecycle where Self: UIViewController {
    func navigationMain(vc: UIViewController, animated: Bool) {
        let navigationController = UINavigationController()
        let mainView = vc
        navigationController.viewControllers = [mainView]
        UIApplication.shared.windows.first?.rootViewController = navigationController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func present(_ vc: UIViewController, animated: Bool) {
        self.present(vc, animated: animated, completion: nil)
    }

    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }

    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }
}
