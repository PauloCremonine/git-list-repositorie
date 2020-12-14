//
//  Routerable.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

protocol Routerable {
    var controllerFrom: ViewLifecycle! { get }

    func dismiss(animated: Bool) 
    func pop(animated: Bool)
}

extension Routerable {
    func dismiss(animated: Bool) {
        controllerFrom.dismiss(animated: animated)
    }

    func pop(animated: Bool) {
        controllerFrom.pop(animated: animated)
    }
}
