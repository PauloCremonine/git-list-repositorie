//
//  ListRepositoriesPresenter.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

typealias ListRepositoriesPresenterDependencies = (
    interactor: ListRepositoriesInteractor,
    router: ListRepositoriesRouterOutput,
    controller: ListRepositoriesDisplayLogic
)

protocol ListRepositoriesPresentationLogic: class {
    func fetch(page: Int)
}

protocol ListRepositoriesDisplayLogic: class {
    func didDisplayError(error: String)
    func didDisplayFetch(model: [ListRepositoriesViewModels]?)
}

final class ListRepositoriesPresenter: ListRepositoriesPresentationLogic {
    weak var output: ListRepositoriesDisplayLogic?
    private let dependencies: ListRepositoriesPresenterDependencies
    
    init(dependencies: ListRepositoriesPresenterDependencies) {
        self.dependencies = dependencies
        self.dependencies.interactor.output = self
    }

    func didToError(error: String) {
        self.dependencies.router.transitionError(error: error)
    }

    func didToConnectError(error: String) {
        self.dependencies.router.transitionErrorConnect(error: error)
    }

    func didCloseError() {
        self.dependencies.router.transitionCloseError()
    }
    
    func fetch(page: Int) {
        self.dependencies.interactor.fetch(page: page)
    }
}

extension ListRepositoriesPresenter : ListRepositoriesBusinessLogicOutput {
    func didToFetchResult(data: [ListRepositoriesViewModels]?) {
        self.output?.didDisplayFetch(model: data)
    }
    func didToFetchError(error: String){
        self.output?.didDisplayError(error: error)
        
    }
}
