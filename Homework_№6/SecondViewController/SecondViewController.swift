//
//  SecondViewController.swift
//  Homework_№6
//
//  Created by Андрей Шамин on 11/20/20.
//

import UIKit

class SecondViewController: UIViewController {

    let customView = SecondCustomView()
    var presenter:ISecondViewControllerPresenter

    init(presenter:ISecondViewControllerPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = customView
        presenter.viewDidLoad(ui: self.customView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showInfoAlert()
    }

    private func showInfoAlert() {
        let alert = UIAlertController(title: "Observer Pattern", message: "При нажатии на кнопку старта таймера запускатеся таймер, который рандомно раз в секунду меняет значение переменной, которая имеет следующие возможные стейты - first/second/third,. Значение переменной будет выводиться в верхней части окна", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated:true)
    }
}


extension SecondViewController: INavigationSeed {
    var vc: UIViewController { self }
}
