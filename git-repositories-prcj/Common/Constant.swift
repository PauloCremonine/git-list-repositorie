//
//  Constant.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

struct Constant {
    //MARK - URL
    static let baseUrl = "https://api.github.com/search/repositories"
    
    //MARK - Colors
    static let colorError = UIColor.init(red: 215/255, green: 121/255, blue: 118/255, alpha: 1.0)
    static let colorGitHubLabel = UIColor.init(red: 3/255, green: 101/255, blue: 214/255, alpha: 1.0)
    static let colorGray = UIColor.init(red: 227/255, green: 227/255, blue: 227/255, alpha: 1.0)
    static let colorLightGray = UIColor.init(red: 250/255, green: 246/255, blue: 244/255, alpha: 1.0)
        
    //MARK - Space
    static let constantSpace5 = CGFloat(5.0)
    static let constantSpace10 = CGFloat(10.0)
    static let constantSpace20 = CGFloat(20.0)
    static let constantSpace30 = CGFloat(30.0)
    static let constantSpace50 = CGFloat(50.0)
    static let constantSpace70 = CGFloat(70.0)
}
