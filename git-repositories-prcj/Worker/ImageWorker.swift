//
//  ImageWorker.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

enum ImagesResult<U>
{
    case Success(result: U)
    case Failure(error: String)
}

// MARK: - Images  CRUD operation results

typealias ImageFetchCompletionHandler = (ImagesResult<Data>) -> Void

final class ImageWorker {
    
    var service: ImagesProtocol

    init(service: ImagesProtocol)
    {
      self.service = service
    }
    
    func fetch(url: String, completionHandler: @escaping (Data?, String?) -> Void)
    {
        self.service.fetch(url: url) { (Image: Data?, error: String?) in
            completionHandler(Image, error)
        }
    }
}

protocol ImagesProtocol
{
    // MARK: CRUD operations - Optional error
  
    func fetch(url: String, completionHandler: @escaping (Data?, String?) -> Void)
}
