//
//  MasterView.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

protocol IMasterView: class {
    var didSelectRowAt: ((Int) -> Void)? { get set }

    func setupDataModel(dataModel:[DataModel])
    func deselectRowAt(indexPath: IndexPath)
}

final class MasterView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let tableViewEstimatedHeight: CGFloat = 44.0
    }

    // MARK: - Views

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: - Properties
    private var tableViewDataSource = CustomTableViewDataSource()
    private var tableViewDelegate: CustomTableViewDelegate?
    var didSelectRowAt: ((Int) -> Void)?
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

extension MasterView: IMasterView {
    func deselectRowAt(indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    func setupDataModel(dataModel: [DataModel]) {
        self.tableViewDataSource.dataArray = dataModel
        self.tableView.reloadData()
    }
}

// MARK: - DataSource и Delegate для tableView

private extension MasterView {
    func setupDelegates() {
        self.tableViewDelegate = CustomTableViewDelegate(withDelegate: self)
        self.tableView.dataSource = tableViewDataSource
        self.tableView.delegate = tableViewDelegate
    }
}

// MARK: - MasterViewControllerDelegate - Обработка тапа на ячейку

extension MasterView: MasterViewControllerDelegate{
    func selectedCell(index: Int) {
        self.didSelectRowAt?(index)
    }
}
