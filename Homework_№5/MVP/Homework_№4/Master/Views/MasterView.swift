//
//  MasterView.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

final class MasterView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let tableViewEstimatedHeight:CGFloat = 44.0
    }

    // MARK: - Views

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: - Properties
    private var tableViewDataSource = CustomTableViewDataSource()
    private var tableViewDelegate: CustomTableViewDelegate?
    var didSelectRowAt: ((IndexPath) -> Void)?
    var tableViewCellTappedDelegate: TableViewCellTappedDelegate?

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        setupElements()
        setupDelegates()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func chooseFirstCell() {
        if DeviceTraitStatus.current == .wRhR || DeviceTraitStatus.current == .wRhC{
            self.selectedCell(indexPath: IndexPath(row: 0, section: 0))
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.chooseFirstCell()
    }
}

// MARK: - UI Setup

extension MasterView {
    func setupElements() {
        self.registerTableViewCell()
        overrideUserInterfaceStyle = .light
        self.addSubview(tableView)

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

    }

    func registerTableViewCell() {
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
    }
}


// MARK: - MasterViewPresenter, Получение ответа от MasterPresenter

extension MasterView: MasterViewPresenter {
    func deselectRowAt(row: Int) {
        self.tableView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
    }

    func setupDataModel(dataModel:[DataModel]) {
        self.tableView.reloadData()
    }
}

// MARK: - DataSource и Delegate для tableView

private extension MasterView {
    func setupDelegates() {
        self.tableViewDelegate = CustomTableViewDelegate(withDelegate: self)
        self.tableViewDataSource.dataArray = DataModel.getDataModel()
        self.tableView.dataSource = tableViewDataSource
        self.tableView.delegate = tableViewDelegate
    }
}

// MARK: - MasterViewControllerDelegate - Обработка тапа на ячейку

extension MasterView: MasterViewControllerDelegate{
    func selectedCell(indexPath: IndexPath) {
        self.didSelectRowAt?(indexPath)
    }
}
