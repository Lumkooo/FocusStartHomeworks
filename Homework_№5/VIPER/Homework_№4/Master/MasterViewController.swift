//
//  MasterViewController.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//

import UIKit

class MasterViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let tableViewEstimatedHeight:CGFloat = 44.0
    }

    // MARK: - Properties

    var presenter: ViewToPresenterProtocol?

    // MARK: - Views

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    // MARK: - Жизненный цикл ViewContorller-а

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        presenter?.viewDidLoad()
    }

    private func selectFirstCell() {
        if DeviceTraitStatus.current == .wRhR || DeviceTraitStatus.current == .wRhC{
            presenter?.didSelectRowAt(index: 0)
            presenter?.deselectRowAt(index: 0)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        selectFirstCell()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        selectFirstCell()
    }
}

// MARK: - MasterViewPresenter, Получение ответа от MasterPresenter

extension MasterViewController: MasterViewPresenter {

    func returnDataModel() {
        print("MasterViewController получил ответ от  MasterPresenter и обновил tableView.")
        self.tableView.reloadData()
    }

    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }

}

// MARK: - UITableViewDataSource

extension MasterViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseIdentifier,
                                                       for: indexPath) as? CustomTableViewCell else {
            fatalError("Не удалось инициализировать TableView Cell")
        }
        guard let dataModel = presenter?.dataModelForCell(indexPath: indexPath) else {
            fatalError("Не удалось инициализировать текстовые поля для TableView Cell")
        }
        cell.setupCell(heading: dataModel.heading,
                       text: dataModel.text,
                       time: dataModel.time)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        presenter?.deselectRowAt(index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        Constants.tableViewEstimatedHeight
    }
}

// MARK: - UI Setup

extension MasterViewController {
    func setupElements() {
        registerTableViewCell()
        overrideUserInterfaceStyle = .light
        self.view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true

        self.navigationItem.title = "ДЗ 5"
    }

    func registerTableViewCell() {
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
    }
}
