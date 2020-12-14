//
//  ImageService.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

class ImageService : ImagesProtocol {
    func fetch(url: String, completionHandler: @escaping (Data?, String?) -> Void) {
        guard let imageUrl:URL = URL(string: url) else {
            completionHandler(nil, "Imagem não encontrada.")
            return
        }
        if let imageData = try? Data(contentsOf: imageUrl) {
            completionHandler(imageData, nil)
        }
    }
}
