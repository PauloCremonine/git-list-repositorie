//
//  LaunchScreenPresenter.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

typealias LaunchScreenPresenterDependencies = (
    interactor: LaunchScreenInteractor,
    router: LaunchScreenRouterOutput,
    controller: LaunchScreenDisplayLogic
)

protocol LaunchScreenPresentationLogic: class {
    func didNextView()
}

final class LaunchScreenPresenter: LaunchScreenPresentationLogic {
    private let dependencies: LaunchScreenPresenterDependencies
    
    init(dependencies: LaunchScreenPresenterDependencies) {
        self.dependencies = dependencies
    }
    
    func didNextView() {
        self.dependencies.router.transitionNext()
    }
}

extension LaunchScreenPresenter : LaunchScreenBusinessLogicOutput {
}
