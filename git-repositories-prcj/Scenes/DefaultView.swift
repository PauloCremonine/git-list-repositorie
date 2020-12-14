//
//  DefaultView.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import Foundation

protocol DefaultView {
    func buildView()
    func setupConstraints()
    func setupAditionalConfigurations()
    func setupView()
}

extension DefaultView{
    func setupView(){
        buildView()
        setupConstraints()
        setupAditionalConfigurations()
    }
}
