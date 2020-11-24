//
//  ViewController.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

class ViewController: UIViewController {

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

        let viewBuilder = ViewBuilder()
        let viewDirector = ViewDirector(builder: viewBuilder)
        self.view = viewDirector.createFirstCustomView(firstTarget: #selector(buttonTapped(gesture:)))
    }

    @objc func buttonTapped(gesture:UIGestureRecognizer) {
        presenter.buttonTapped()
    }
}

extension ViewController: INavigationSeed {
    var vc: UIViewController { self }
}


