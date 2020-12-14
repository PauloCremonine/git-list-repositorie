//
//  ListRepositoriesService.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

class ListRepositorieService : ListRepositoriesProtocol {
    func fetch(page: Int, completionHandler: @escaping ([RepositoriesEntity]?, String?) -> Void) {
        
        let urlList = Constant.baseUrl + "?q=language:swift&sort=stars&per_page=10&page=\(page)"
        
        guard let url = URL(string: urlList) else {
            completionHandler(nil, "Url não informada, ou faltante.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completionHandler(nil, "Algum problema ocorreu na chamada.")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, nil)
                return
            }
            
            guard let data = data else {
                completionHandler(nil, "Dados não encontrados")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let dictionaryFromJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let jsonItem = dictionaryFromJSON["items"] as? NSArray
                let jsonData = try JSONSerialization.data(withJSONObject: jsonItem!, options: [])
                let decodedResponse = try jsonDecoder.decode([RepositoriesEntity].self, from: jsonData)

                return completionHandler(decodedResponse, nil)
            } catch {
                completionHandler(nil, "Erro grave.")
            }
        }
        task.resume()
    }
}
