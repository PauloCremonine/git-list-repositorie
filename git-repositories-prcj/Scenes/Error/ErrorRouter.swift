//
//  ErrorRouter.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

final class ErrorRouter {
    func setup(error: String, image: UIImage? = nil) -> ErrorController {
        let controller = ErrorController(error: error, image: image)
        let interactor = ErrorInteractor()
        let dependencies = ErrorPresenterDependencies(interactor: interactor, router: ErrorRouterOutput(controller), controller: controller)
        
        let presenter = ErrorPresenter(dependencies: dependencies)
        controller.presenter = presenter
        return controller
    }
}

final class ErrorRouterOutput: Routerable {
    var controllerFrom: ViewLifecycle!
    init(_ controller: ViewLifecycle) {
        self.controllerFrom = controller
    }

    func transitionNext() {
    }
}
