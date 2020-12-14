//
//  ListRepositoriesPresenterTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 13/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ListRepositoriesPresenterTest: XCTestCase, ListRepositoriesDisplayLogic {
    var sut: ListRepositoriesController!
    var dependencies: ListRepositoriesPresenterDependencies!
    var fetchExpectation: XCTestExpectation!
    var fetchedError: String?
    
    private var viewModel: [ListRepositoriesViewModels]?


    override func setUp()
    {
      super.setUp()
      setupPresenter()
    }
    
    override func tearDown()
    {
      super.tearDown()
    }
    


    func setupPresenter()
    {
        let controller = ListRepositoriesController()
        let interactor = ListRepositoriesInteractor()
        dependencies = ListRepositoriesPresenterDependencies(interactor: interactor, router: ListRepositoriesRouterOutput(controller), controller: controller)
        
        let presenter = ListRepositoriesPresenter(dependencies: dependencies)
        controller.presenter = presenter
        sut = controller
    }
    
    func testFetch(){
        fetchExpectation = XCTestExpectation(description: "Busca repositórios GitHub")
        sut.presenter.output = self
        
        sut.presenter.fetch(page: 1)
        wait(for: [fetchExpectation], timeout: 20.0)
        
        XCTAssertNil(fetchedError)
        XCTAssertEqual(self.viewModel!.count, 10, "Quantidade retornada, diferente do esperado")
    }
    
    func didDisplayFetch(model: [ListRepositoriesViewModels]?) {
        self.viewModel = model
        fetchExpectation.fulfill()
    }
    
    func didDisplayError(error: String) {
        self.fetchedError = error
        fetchExpectation.fulfill()
    }
}
