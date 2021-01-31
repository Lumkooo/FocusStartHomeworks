//
//  ViewController.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/5/20.
//

import UIKit

class CompanyViewController: UIViewController {

    // MARK: - Views

    let companyView = CompanyView()

    // MARK: - Properties

    var presenter: ICompanyPresenter

    // MARK: - Init

    init(presenter: ICompanyPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.companyView
        self.presenter.viewDidLoad(ui: self.companyView)
        self.setupAppendButton()
    }

    // MARK: - Настройка кнопки на navigationBar

    private func setupAppendButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addTapped))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationController?.navigationItem.rightBarButtonItem = add
    }

    @objc func addTapped() {
        self.presenter.addingNewCompany()
    }
}

