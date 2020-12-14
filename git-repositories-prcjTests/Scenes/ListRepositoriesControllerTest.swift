//
//  ListRepositoriesControllerTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 13/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ListRepositoriesControllerTest: XCTestCase, ListRepositoriesDisplayLogic {
    
    var sut: ListRepositoriesController!
    var window: UIWindow!

    var fetchExpectation: XCTestExpectation!
    var fetchedError: String?
    
    private var viewModel: [ListRepositoriesViewModels]?

    
    override func setUp()
    {
      super.setUp()
      window = UIWindow()
      setupController()
    }
    
    override func tearDown()
    {
      window = nil
      super.tearDown()
    }
    
    func setupController()
    {
        let controller = ListRepositoriesRouter().setup()
        sut = controller
    }
    
    func loadView()
    {
      window.addSubview(sut.view)
      RunLoop.current.run(until: Date())
    }

    func testShouldDisplayFetchedRepositorieSpy()
    {
        sut.didDisplayFetch(model: [Repositories.Repositorie.repModel1, Repositories.Repositorie.repModel2])
      
        let cells = sut.viewToView.repositoriesTableView.numberOfRows(inSection: 0)
        XCTAssertEqual(cells, 2)
    }

    func testShouldDisplayFetch()
    {
        fetchExpectation = XCTestExpectation(description: "Busca repositórios GitHub")
        sut.presenter.output = self
        
        sut.presenter.fetch(page: 1)
        wait(for: [fetchExpectation], timeout: 20.0)
        sut.didDisplayFetch(model: viewModel)
        
        let cells = sut.viewToView.repositoriesTableView.numberOfRows(inSection: 0)
        XCTAssertEqual(cells, 10)
    }

    func testShouldDisplayNextPage()
    {
        fetchExpectation = XCTestExpectation(description: "Busca repositórios paginado GitHub")
        sut.presenter.output = self
        
        sut.didNextPage(page: 2)
        wait(for: [fetchExpectation], timeout: 20.0)
        sut.didDisplayFetch(model: self.viewModel)
        
        let cells = sut.viewToView.repositoriesTableView.numberOfRows(inSection: 0)
        XCTAssertEqual(cells, 10)
    }

    func didDisplayError(error: String) {
        self.fetchedError = error
        fetchExpectation.fulfill()
    }
    
    func didDisplayFetch(model: [ListRepositoriesViewModels]?) {
        self.viewModel = model
        fetchExpectation.fulfill()
    }

}
