//
//  ListRepositoriesWorker.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

enum ListRepositoriesResult<U>
{
    case Success(result: U)
    case Failure(error: String)
}

// MARK: - ListRepositories  CRUD operation results

typealias FetchCompletionHandler = (ListRepositoriesResult<RepositoriesEntity>) -> Void

final class ListRepositoriesWorker {
    
    var service: ListRepositoriesProtocol

    init(service: ListRepositoriesProtocol)
    {
      self.service = service
    }
    
    func fetch(page: Int, completionHandler: @escaping ([RepositoriesEntity]?, String?) -> Void)
    {
        self.service.fetch(page: page) { (result: [RepositoriesEntity]?, error: String?) in
            completionHandler(result, error)
        }
    }
}

protocol ListRepositoriesProtocol
{
    // MARK: CRUD operations - Optional error
  
    func fetch(page: Int, completionHandler: @escaping ([RepositoriesEntity]?, String?) -> Void)
}


