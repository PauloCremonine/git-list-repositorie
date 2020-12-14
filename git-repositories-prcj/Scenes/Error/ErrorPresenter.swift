//
//  ErrorPresenter.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

typealias ErrorPresenterDependencies = (
    interactor: ErrorInteractor,
    router: ErrorRouterOutput,
    controller: ErrorDisplayLogic
)

protocol ErrorPresentationLogic: class {
    func didNextView()
}


final class ErrorPresenter: ErrorPresentationLogic {
    private let dependencies: ErrorPresenterDependencies
    
    init(dependencies: ErrorPresenterDependencies) {
        self.dependencies = dependencies
    }
    
    func didNextView() {
        self.dependencies.router.transitionNext()
    }
}

extension ErrorPresenter : ErrorBusinessLogicOutput {
}
