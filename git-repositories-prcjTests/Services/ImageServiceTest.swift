//
//  ImageServiceTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 13/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ImageServiceTest: XCTestCase {
    
    var service: ImagesProtocol!
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
        service = ImageService()
    }
    
    
    func testFetch(){
        var fetchedImage = Data()
        var fetchedError: String?
        
        let expectation = XCTestExpectation(description: "Download avatar")
        
        service.fetch(url: Repositories.Repositorie.owner.avatar_url) { (result: Data?, error: String?) -> Void in
            fetchedError = error
            fetchedImage = result ?? Data()
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertNil(fetchedError)
        XCTAssertNotEqual(fetchedImage.base64EncodedString() , "", "Avatar não encontrado")
    }
}

