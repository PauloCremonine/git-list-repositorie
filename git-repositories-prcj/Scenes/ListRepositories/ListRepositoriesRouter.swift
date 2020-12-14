//
//  ListRepositoriesRouter.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

final class ListRepositoriesRouter {
    func setup() -> ListRepositoriesController {
        let controller = ListRepositoriesController()
        let interactor = ListRepositoriesInteractor()

        let dependencies = ListRepositoriesPresenterDependencies(interactor: interactor, router: ListRepositoriesRouterOutput(controller), controller: controller)
        
        let presenter = ListRepositoriesPresenter(dependencies: dependencies)
        controller.presenter = presenter
        return controller
    }
}

final class ListRepositoriesRouterOutput: Routerable {
    var controllerFrom: ViewLifecycle!
    var errorController: ViewLifecycle!
    
    init(_ controller: ViewLifecycle) {
        self.controllerFrom = controller
    }
    
    func transitionError(error: String) {
        errorController = ErrorRouter().setup(error: error)
        controllerFrom.present(errorController as! UIViewController, animated: true)
    }
    
    func transitionErrorConnect(error: String) {
        errorController = ErrorRouter().setup(error: error,image: UIImage(named: "SF_wifi"))
        controllerFrom.present(errorController as! UIViewController, animated: true)
    }

    func transitionCloseError() {
        guard errorController != nil else {
            return
        }
        self.errorController.dismiss(animated: true)
    }

}
