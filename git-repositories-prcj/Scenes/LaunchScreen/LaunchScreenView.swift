//
//  LaunchScreenView.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol LaunchScreenViewDelegate: class {
    func didNextView()
}

final class LaunchScreenView: UIView {

    weak var delegate: LaunchScreenViewDelegate?
  
    // MARK: Objects
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")!.resize(toWidth: 300)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Init view
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
}

// MARK: Extension View

extension LaunchScreenView {
    fileprivate func prepareAnimation(){
        let transition:CATransition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        transition.delegate = self
        self.logoImageView.layer.add(transition, forKey: kCATransition)
    }
}


extension LaunchScreenView : CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            self.delegate?.didNextView()
        }
    }
}


// MARK: Default setup view

extension LaunchScreenView : DefaultView {
    func buildView() {
        self.addSubview(logoImageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    func setupAditionalConfigurations() {
        self.backgroundColor = .white
        self.prepareAnimation()
    }
}
