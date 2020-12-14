//
//  ErrorView.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol ErrorViewDelegate: class {
    func didCloseView()
}

final class ErrorView: UIView {

    weak var delegate: ErrorViewDelegate?

    var error: String? {
        didSet{
            self.errorLabel.text = error
        }
    }

    var imageError: UIImage = UIImage(named: "error")! {
        didSet{
            self.errorImageView.image = imageError.resize(toWidth: 300)
        }
    }

    // MARK: Objects
    
    let errorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "error")!.resize(toWidth: 300)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = Constant.colorError
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
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

extension ErrorView {
}

// MARK: Default setup view

extension ErrorView : DefaultView {
    func buildView() {
        self.addSubview(errorImageView)
        self.addSubview(errorLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            errorImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            errorImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            errorLabel.topAnchor.constraint(equalTo: self.errorImageView.bottomAnchor, constant: Constant.constantSpace10),
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: Constant.constantSpace10),
            errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Constant.constantSpace10),
        ])
    }
    
    func setupAditionalConfigurations() {
        self.backgroundColor = .white

    }
}
