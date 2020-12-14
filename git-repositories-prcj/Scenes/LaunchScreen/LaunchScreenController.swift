//
//  LaunchScreenController.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol LaunchScreenDisplayLogic: class {
}

final class LaunchScreenController: UIViewController {

    var viewToView = LaunchScreenView()
    var presenter: LaunchScreenPresenter!
    
    // MARK: Object lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

  // MARK: Setup

    private func setup() {
        let viewController = self
        self.viewToView.delegate = self
        viewController.view = self.viewToView
    }
}

// MARK: Delegates View

extension LaunchScreenController: LaunchScreenViewDelegate {
    func didNextView() {
        self.presenter.didNextView()
    }
}

extension LaunchScreenController : LaunchScreenDisplayLogic {
}

extension LaunchScreenController: ViewLifecycle {}
