//
//  ImageWorkerTest.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 13/12/20.
//

@testable import git_repositories_prcj
import XCTest

class ImageWorkerTest: XCTestCase {
    
    var worker: ImageWorker!
    static var testData: Data!

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
        worker = ImageWorker(service: ImageSpy())
    }
    
    class ImageSpy: ImageService {
        
    }
    
    func testFetch(){
        var fetchImage = Data()
        var fetchedError: String?
        
        let expectation = XCTestExpectation(description: "Download avatar")
        worker.fetch(url: Repositories.Repositorie.owner.avatar_url){ (result, error) -> Void in
            fetchedError = error
            fetchImage = result ?? Data()
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        
        XCTAssertNil(fetchedError)
        XCTAssertNotEqual(fetchImage.base64EncodedString() , "", "Avatar não encontrado")
    }
}
