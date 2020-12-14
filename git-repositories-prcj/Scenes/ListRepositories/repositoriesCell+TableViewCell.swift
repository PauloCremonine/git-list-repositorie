//
//  repositoriesCell+TableViewCell.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

class repositoriesCell: UITableViewCell {
        
    var data: ListRepositoriesViewModels? {
        didSet {
            guard let data = data else { return }
            self.nameLabel.text = data.name
            self.descriptionLabel.text = data.description
            self.ownerLabel.text = data.owner
            self.licenseLabel.text = data.license
            self.forkLabel.text = String(data.forks)
            self.starLabel.text = data.stars
            
            guard data.avatar != nil else {
                return
            }
            
            if let image = UIImage(data: data.avatar!) {
                DispatchQueue.main.async { [weak self] in
                    self?.avatarImageView.maskCircle(anyImage: image)
                }
            }
        }
    }
    
    let backdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.Border(radius: 5.0, color: Constant.colorGray)

        var lineViewTop = UIView(frame: CGRect(x: 20, y: 40, width: UIScreen.main.bounds.width - 60.0, height: 1.0))
        lineViewTop.layer.borderWidth = 1.0
        lineViewTop.layer.borderColor = Constant.colorGray.cgColor
        view.addSubview(lineViewTop)
        
        var lineViewBottom = UIView(frame: CGRect(x: 20, y: 150, width: UIScreen.main.bounds.width - 60.0, height: 1.0))
        lineViewBottom.layer.borderWidth = 1.0
        lineViewBottom.layer.borderColor = Constant.colorGray.cgColor
        view.addSubview(lineViewBottom)

        return view
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = Constant.colorGitHubLabel
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingHead
        return label
    }()

    let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "SF_star_circle_fill")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let forkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "fork")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let licenseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "license")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let starLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .lightGray
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    let ownerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = Constant.colorGitHubLabel
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let forkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let licenseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = Constant.colorGitHubLabel
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .lightGray
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear

        self.contentView.addSubview(backdView)
        self.backdView.addSubview(ownerLabel)
        
        self.backdView.addSubview(licenseLabel)
        self.backdView.addSubview(licenseImageView)
        
        self.backdView.addSubview(avatarImageView)
        self.backdView.addSubview(nameLabel)
        self.backdView.addSubview(descriptionLabel)

        self.backdView.addSubview(forkImageView)
        self.backdView.addSubview(forkLabel)

        self.backdView.addSubview(starLabel)
        self.backdView.addSubview(starImageView)

        NSLayoutConstraint.activate([
            backdView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constant.constantSpace5),
            backdView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.constantSpace5),
            backdView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -Constant.constantSpace5),
            backdView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constant.constantSpace5),

            ownerLabel.topAnchor.constraint(equalTo: self.backdView.topAnchor, constant: Constant.constantSpace10),
            ownerLabel.leadingAnchor.constraint(equalTo: self.backdView.leadingAnchor, constant: Constant.constantSpace10),

            licenseImageView.topAnchor.constraint(equalTo: self.backdView.topAnchor, constant: Constant.constantSpace10),
            licenseImageView.trailingAnchor.constraint(equalTo: self.backdView.trailingAnchor, constant: -Constant.constantSpace10),
            licenseImageView.heightAnchor.constraint(equalToConstant: Constant.constantSpace20),
            licenseImageView.widthAnchor.constraint(equalToConstant: Constant.constantSpace20),

            licenseLabel.centerYAnchor.constraint(equalTo: self.licenseImageView.centerYAnchor),
            licenseLabel.trailingAnchor.constraint(equalTo: self.licenseImageView.leadingAnchor, constant: -Constant.constantSpace10),

            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.constantSpace30),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constant.constantSpace70),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constant.constantSpace70),

            nameLabel.topAnchor.constraint(equalTo: self.avatarImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: Constant.constantSpace20),
            nameLabel.trailingAnchor.constraint(equalTo: self.backdView.trailingAnchor, constant: -Constant.constantSpace20),

            descriptionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: -Constant.constantSpace5),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: Constant.constantSpace20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.backdView.trailingAnchor, constant: -Constant.constantSpace20),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.starImageView.topAnchor, constant: -Constant.constantSpace10),
            
            forkImageView.bottomAnchor.constraint(equalTo: self.backdView.bottomAnchor, constant: -Constant.constantSpace10),
            forkImageView.leadingAnchor.constraint(equalTo: self.backdView.leadingAnchor, constant: Constant.constantSpace10),
            forkImageView.heightAnchor.constraint(equalToConstant: Constant.constantSpace20),
            forkImageView.widthAnchor.constraint(equalToConstant: Constant.constantSpace20),

            forkLabel.centerYAnchor.constraint(equalTo: self.forkImageView.centerYAnchor),
            forkLabel.leadingAnchor.constraint(equalTo: self.forkImageView.trailingAnchor, constant: Constant.constantSpace10),

            starImageView.bottomAnchor.constraint(equalTo: self.backdView.bottomAnchor, constant: -Constant.constantSpace10),
            starImageView.trailingAnchor.constraint(equalTo: self.backdView.trailingAnchor, constant: -Constant.constantSpace10),
            starImageView.heightAnchor.constraint(equalToConstant: Constant.constantSpace20),
            starImageView.widthAnchor.constraint(equalToConstant: Constant.constantSpace20),
            
            starLabel.centerYAnchor.constraint(equalTo: self.starImageView.centerYAnchor),
            starLabel.trailingAnchor.constraint(equalTo: self.starImageView.leadingAnchor, constant: -Constant.constantSpace10),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

