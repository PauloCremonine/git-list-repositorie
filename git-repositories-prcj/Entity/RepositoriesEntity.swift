//
//  RepositoriesEntity.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

struct RepositoriesEntity: Codable {
    let full_name: String
    let stargazers_count: Double
    let description: String?
    let forks_count: Int
    let owner: OwnerEntity
    let license: LicenseEntity?
}

struct OwnerEntity: Codable {
    let login: String
    let avatar_url: String
}

struct LicenseEntity: Codable {
    let spdx_id: String?
}
