//
//  ListRepositoriesInteractor.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol ListRepositoriesBusinessLogic: class {
    func fetch(page: Int)
}

protocol ListRepositoriesBusinessLogicOutput: class {
    func didToFetchResult(data: [ListRepositoriesViewModels]?)
    func didToFetchError(error: String)
}

class ListRepositoriesInteractor: ListRepositoriesBusinessLogic {
    weak var output: ListRepositoriesBusinessLogicOutput?
    var worker = ListRepositoriesWorker(service: ListRepositorieService())
    
    func fetch(page: Int) {
        var viewModel: [ListRepositoriesViewModels]?
        
        self.worker.fetch(page: page){ (result, error) -> Void in
            guard error == nil else {
                self.output?.didToFetchError(error: error!)
                return
            }
            if let repositorie = result {
                viewModel = repositorie.map{
                    ListRepositoriesViewModels(name: $0.full_name, description: $0.description ?? "", stars: $0.stargazers_count.formatNumber(), forks: $0.forks_count, owner: $0.owner.login, license: $0.license?.spdx_id ?? "", avatar: self.extractImage(imagePath: $0.owner.avatar_url))
                }
            }
            self.output?.didToFetchResult(data: viewModel)
        }
    }
}

extension ListRepositoriesInteractor {
    func extractImage(imagePath: String) -> Data? {
        var dataImage: Data?
        guard !imagePath.isEmpty else {
            return nil
        }

        let imageWorker = ImageWorker(service: ImageService())
        imageWorker.fetch(url: imagePath){ (data, error) -> Void in
            dataImage = data!
        }

        let image = UIImage(data:  dataImage!)
        dataImage = image?.highestQualityJPEGNSData
        return dataImage
    }
}
