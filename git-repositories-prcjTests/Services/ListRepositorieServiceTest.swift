//
//  ListRepositorieServiceTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 13/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ListRepositoriesServiceTest: XCTestCase {
    
    var service: ListRepositoriesProtocol!
    override func setUp()
    {
      super.setUp()
      setupService()
    }
    
    override func tearDown()
    {
      super.tearDown()
    }
    
    func setupService(){
        service = ListRepositorieService()
    }
    
    
    func testFetch(){
        var fetchedRepositories = [RepositoriesEntity]()
        var fetchedError: String?
        
        let expectation = XCTestExpectation(description: "Busca repositórios GitHub")
        
        service.fetch(page: 1) { (result: [RepositoriesEntity]?, error: String?) -> Void in
            fetchedError = error
            fetchedRepositories = result ?? []
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertNil(fetchedError)
        XCTAssertEqual(fetchedRepositories.count, 10, "Quantidade retornada, diferente do esperado")
        
    }
}

