//
//  PersonsView.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol IPersonsView: class {
    var cellTapped: ((IndexPath) -> Void)? { get set }
    var cellRemoved: ((IndexPath) -> Void)? { get set }

    func showDataOnScreen(persons: [Person])
}

final class PersonsView: UIView {

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let myTableView = UITableView()
        myTableView.register(UITableViewCell.self,
                             forCellReuseIdentifier: Constants.personsTableViewCellID)
        return myTableView
    }()

    // MARK: - Properties

    var cellTapped: ((IndexPath) -> Void)?
    var cellRemoved: ((IndexPath) -> Void)?
    private var tableViewDataSource: PersonsTableViewDataSource?
    private var tableViewDelegate: CustomTableViewDelegate?

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupElements()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - IPersonsView

extension PersonsView: IPersonsView {
    func showDataOnScreen(persons: [Person]) {
        self.tableViewDataSource?.persons = persons
        self.tableView.reloadData()
    }
}

// MARK: - UISetup

private extension PersonsView {
    func setupElements() {
        self.backgroundColor = .systemBackground
        self.setupTableView()
    }

    func setupTableView() {
        self.tableViewDelegate = CustomTableViewDelegate(withDelegate: self)
        self.tableViewDataSource = PersonsTableViewDataSource(delegate: self)
        self.tableView.dataSource = tableViewDataSource
        self.tableView.delegate = tableViewDelegate
        self.tableView.backgroundColor = UIColor.clear
        self.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - ITableViewDelegate

extension PersonsView: ITableViewDelegate {
    func selectedCell(indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.cellTapped?(indexPath)
    }
}

// MARK: - ITableViewDataSource

extension PersonsView: ITableViewDataSource {
    func cellRemoved(indexPath : IndexPath) {
        self.cellRemoved?(indexPath)
    }
}
