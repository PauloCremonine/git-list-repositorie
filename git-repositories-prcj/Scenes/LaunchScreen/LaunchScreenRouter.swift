//
//  LaunchScreenRouter.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

final class LaunchScreenRouter {
    func setup() -> LaunchScreenController {
        let controller = LaunchScreenController()
        let interactor = LaunchScreenInteractor()
        let dependencies = LaunchScreenPresenterDependencies(interactor: interactor, router: LaunchScreenRouterOutput(controller), controller: controller)
        
        let presenter = LaunchScreenPresenter(dependencies: dependencies)
        controller.presenter = presenter
        return controller
    }
}

final class LaunchScreenRouterOutput: Routerable {
    var controllerFrom: ViewLifecycle!
    init(_ controller: ViewLifecycle) {
        self.controllerFrom = controller
    }

    func transitionNext() {
        let controllerTo = ListRepositoriesRouter().setup()
        controllerFrom.navigationMain(vc: controllerTo, animated: true)
    }
}
