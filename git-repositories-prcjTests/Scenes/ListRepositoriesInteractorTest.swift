//
//  ListRepositoriesInteractorTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 13/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ListRepositoriesInteractorTest: XCTestCase, ListRepositoriesBusinessLogicOutput {
    var sut: ListRepositoriesController!
    var dependencies: ListRepositoriesPresenterDependencies!
    var fetchExpectation: XCTestExpectation!
    var fetchedError: String?
    
    private var viewModel: [ListRepositoriesViewModels]?
    
    override func setUp()
    {
      super.setUp()
      setupInteractor()
    }
    
    override func tearDown()
    {
      super.tearDown()
    }

    
    func setupInteractor(){
        let controller = ListRepositoriesController()
        let interactor = ListRepositoriesInteractor()
        dependencies = ListRepositoriesPresenterDependencies(interactor: interactor, router: ListRepositoriesRouterOutput(controller), controller: controller)
        
        let presenter = ListRepositoriesPresenter(dependencies: dependencies)
        controller.presenter = presenter
        sut = controller
    }
    
    func testFetch(){
        fetchExpectation = XCTestExpectation(description: "Busca repositórios GitHub")
        dependencies.interactor.output = self

        dependencies.interactor.fetch(page: 1)
        wait(for: [fetchExpectation], timeout: 10.0)
        
        XCTAssertNil(fetchedError)
        XCTAssertEqual(self.viewModel!.count, 10, "Quantidade retornada, diferente do esperado")
    }
    
    func didToFetchResult(data: [ListRepositoriesViewModels]?) {
        self.viewModel = data
        fetchExpectation.fulfill()
    }
    
    func didToFetchError(error: String) {
        self.fetchedError = error
        fetchExpectation.fulfill()
    }

}
