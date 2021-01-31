//
//  CompanyView.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

protocol ICompanyView: class {
    var cellTapped: ((IndexPath) -> Void)? { get set }
    var cellRemoved: ((IndexPath) -> Void)? { get set }

    func showDataOnScreen(companies: [Company])
}

final class CompanyView: UIView {

    // MARK: - Views

    private lazy var tableView: UITableView = {
        let myTableView = UITableView()
        myTableView.register(UITableViewCell.self,
                             forCellReuseIdentifier: Constants.companyTableViewCellID)
        return myTableView
    }()

    // MARK: - Properties

    var cellTapped: ((IndexPath) -> Void)?
    var cellRemoved: ((IndexPath) -> Void)?
    private var tableViewDataSource: CompanyTableViewDataSource?
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

// MARK: - ICompanyView

extension CompanyView: ICompanyView {
    func showDataOnScreen(companies: [Company]) {
        self.tableViewDataSource?.companies = companies
        self.tableView.reloadData()
    }
}

// MARK: - UISetup

private extension CompanyView {
    func setupElements() {
        self.backgroundColor = .systemBackground
        self.setupTableView()
    }

    func setupTableView() {
        self.tableViewDelegate = CustomTableViewDelegate(withDelegate: self)
        self.tableViewDataSource = CompanyTableViewDataSource(delegate: self)
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

extension CompanyView: ITableViewDelegate {
    func selectedCell(indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.cellTapped?(indexPath)
    }
}

// MARK: - ITableViewDataSource

extension CompanyView: ITableViewDataSource {
    func cellRemoved(indexPath : IndexPath) {
        self.cellRemoved?(indexPath)
    }
}
