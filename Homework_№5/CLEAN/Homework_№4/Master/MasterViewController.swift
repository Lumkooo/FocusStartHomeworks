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
    private var presenter: IMasterPresenter

    // MARK: - Init

    init(presenter: IMasterPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Жизненный цикл ViewContorller-а

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = masterView
        self.presenter.viewDidLoad(view: self.masterView)
        self.navigationItem.title = "ДЗ 5, CLEAN"
    }
}
