//
//  MasterViewController.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//

import UIKit

final class MasterViewController: UIViewController {

    // MARK: - Properties

    private let masterView = MasterView()
    var presenter: ViewToPresenterProtocol?

    // MARK: - Жизненный цикл ViewContorller-а

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = masterView
        self.presenter?.viewDidLoad(view: self.masterView)
        self.navigationItem.title = "ДЗ 5"
    }
}
