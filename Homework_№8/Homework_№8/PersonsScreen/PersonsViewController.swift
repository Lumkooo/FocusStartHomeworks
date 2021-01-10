//
//  PersonsViewController.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

class PersonsViewController: UIViewController {

    // MARK: - Views

    let personsView = PersonsView()

    // MARK: - Properties

    var presenter: IPersonsPresenter

    // MARK: - Init

    init(presenter: IPersonsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.personsView
        self.presenter.viewDidLoad(ui: self.personsView)
        self.setupAppendButton()
    }

    // MARK: - Настройка кнопки на navigationBar-е

    private func setupAppendButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addTapped))
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        self.navigationController?.navigationItem.rightBarButtonItem = add
    }

    @objc func addTapped() {
        self.presenter.addNewPerson()
    }
}

