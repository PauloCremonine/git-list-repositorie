//
//  Repositorie.swift
//  git-repositories-prcjTests
//
//  Created by Paulo Cremonine on 12/12/20.
//

@testable import git_repositories_prcj
import XCTest

struct Repositories
{
  struct Repositorie
  {
    static let owner = OwnerEntity(login: "owner", avatar_url: "https://avatars2.githubusercontent.com/u/43747993?s=400&v=4")
    
    static let license = LicenseEntity(spdx_id: "MIT")
      
    static let repModel1 = ListRepositoriesViewModels(name: "owner/Repositório_1", description: "Teste de repositórios", stars: "10", forks: 0, owner: "Owmer1", license: "MIT", avatar: nil)

    static let repModel2 = ListRepositoriesViewModels(name: "owner/Repositório_2", description: "Teste de repositórios 2", stars: "10k", forks: 0, owner: "Owmer2", license: "MIT", avatar: nil)
  }
}
