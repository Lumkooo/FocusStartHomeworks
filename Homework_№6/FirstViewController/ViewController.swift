//
//  ViewController.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

class ViewController: UIViewController {

    let customView = CustomView()
    var presenter:IViewControllerPresenter

    init(presenter:IViewControllerPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        presenter.viewDidLoad(ui: self.customView)
    }
}

extension ViewController: INavigationSeed {
    var vc: UIViewController { self }
}


