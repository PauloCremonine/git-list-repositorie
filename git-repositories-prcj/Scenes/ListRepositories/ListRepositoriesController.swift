//
//  ListRepositoriesController.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

final class ListRepositoriesController: UIViewController {

    var viewToView = ListRepositoriesView()
    var presenter: ListRepositoriesPresenter!
    var isConnecton: Bool = true
    
    // MARK: Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: Setup

    private func setup() {
        NotificationCenter.default.addObserver(self, selector: #selector(statusManager), name: .ConnectChanged, object: nil)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationItem.title = "Repositórios"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 42/255, green: 42/255, blue: 42/255, alpha: 0.5)

        let viewController = self
        viewToView.delegate = self
        viewController.view = viewToView
        self.presenter.output = self
        self.presenter.fetch(page: 1)
    }
 
    @objc func statusManager(_ notification: Notification) {
        if let status = notification.object {
            DispatchQueue.main.async { [weak self] in
                if !(status as! Bool) && ((self?.isConnecton) != nil) {
                    self?.isConnecton = false
                    self?.presenter.didToConnectError(error: "Ops! Algum problema de conexão.")
                }
                else{
                    self?.presenter.didCloseError()
                    self?.isConnecton = true
                }
            }
        }
    }    
}

// MARK: Delegates View

extension ListRepositoriesController: ListRepositoriesViewDelegate {
    func didNextPage(page: Int) {
        self.presenter.fetch(page: page)
    }
    
    func didRefresh() {
        self.viewToView.page = 1
        self.presenter.fetch(page: 1)
    }
}

extension ListRepositoriesController : ListRepositoriesDisplayLogic {
    func didDisplayError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.presenter.didToError(error: error)
        }
    }

    func didDisplayFetch(model: [ListRepositoriesViewModels]?) {
        guard model != nil else {
            self.viewToView.isLoading = false
            return
        }
        self.viewToView.reloadView(data: model!)
    }
}

extension ListRepositoriesController: ViewLifecycle {}
