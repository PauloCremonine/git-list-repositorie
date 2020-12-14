//
//  ListRepositoriesWorkerTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 12/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ListRepositoriesWorkerTest: XCTestCase {
    
    var worker: ListRepositoriesWorker!
    static var testListRepositories: [RepositoriesEntity]!

    
    override func setUp()
    {
      super.setUp()
      setupWorker()
    }
    
    override func tearDown()
    {
      super.tearDown()
    }

    
    func setupWorker(){
        worker = ListRepositoriesWorker(service: ListRepositorieServiceSpy())
    }
    
    class ListRepositorieServiceSpy: ListRepositorieService {
        
    }
    
    func testFetch(){
        var fetchedRepositories = [RepositoriesEntity]()
        var fetchedError: String?
        
        let expectation = XCTestExpectation(description: "Busca repositórios GitHub")
        worker.fetch(page: 1){ (result, error) -> Void in
            fetchedError = error
            fetchedRepositories = result ?? []
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertNil(fetchedError)
        XCTAssertEqual(fetchedRepositories.count, 10, "Quantidade retornada, diferente do esperado")
    }
}
