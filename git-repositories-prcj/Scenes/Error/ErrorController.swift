//
//  ErrorController.swift
//  git-repositories-prcj
//
//  Created by Paulo Cremonine on 09/12/20.
//

import UIKit

protocol ErrorDisplayLogic: class {
}

final class ErrorController: UIViewController {

    var viewToView = ErrorView()
    var presenter: ErrorPresenter!

    var error: String?
    var image: UIImage?
    
    // MARK: Object lifecycle

    init(error: String, image: UIImage? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.error = error
        self.image = image
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.error = nil        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    

  // MARK: Setup

    private func setup() {
        let viewController = self
        
        self.viewToView.delegate = self
        viewController.view = self.viewToView
        
        self.viewToView.error = self.error
        if self.image != nil{
            self.viewToView.imageError = self.image!
        }
    }
}

// MARK: Delegates View

extension ErrorController: ErrorViewDelegate {
    func didCloseView() {
    
    }
}

extension ErrorController : ErrorDisplayLogic {
}

extension ErrorController: ViewLifecycle {}

