//
//  ListRepositoriesView.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol ListRepositoriesViewDelegate: class {
    func didRefresh()
    func didNextPage(page: Int)
}

final class ListRepositoriesView: UIView {

    weak var delegate: ListRepositoriesViewDelegate?
    var itens: [ListRepositoriesViewModels] = []
    var isLoading = true
    var page: Int = 1
    
    // MARK: Objects

    lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.translatesAutoresizingMaskIntoConstraints = false
        refresh.attributedTitle = NSAttributedString(string: "Carregando ...")
        refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        return refresh
    }()

    lazy var repositoriesTableView : UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.separatorStyle = .none
        tableview.backgroundColor = .clear
        return tableview
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

extension ListRepositoriesView {
    func reloadView(data: [ListRepositoriesViewModels]) {
        
        if self.page == 1 {
            self.itens.removeAll()
        }
        self.itens.append(contentsOf: data)
        DispatchQueue.main.async { [weak self] in
            self?.repositoriesTableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
        self.isLoading = false
    }
    
    @objc func refresh(_ sender: Any) {
        self.delegate?.didRefresh()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) && !self.isLoading) {
            self.isLoading = true
            self.page = self.page + 1
            self.delegate?.didNextPage(page: page)
        }
    }
}

// MARK: Default setup view

extension ListRepositoriesView : DefaultView {
    func buildView() {
        self.addSubview(repositoriesTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoriesTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            repositoriesTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: Constant.constantSpace5),
            repositoriesTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.constantSpace5),
            repositoriesTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupAditionalConfigurations() {
        self.backgroundColor = Constant.colorLightGray
        self.repositoriesTableView.dataSource = self
        self.repositoriesTableView.delegate = self
        self.repositoriesTableView.register(repositoriesCell.self, forCellReuseIdentifier: "repositoriesCell")
        self.repositoriesTableView.addSubview(refreshControl)
    }
}

extension ListRepositoriesView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoriesCell", for: indexPath) as! repositoriesCell
        cell.selectionStyle = .none
        cell.data = self.itens[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
