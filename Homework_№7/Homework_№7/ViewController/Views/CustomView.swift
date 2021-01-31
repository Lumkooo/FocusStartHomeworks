//
//  Views.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

protocol ICustomView: class {
    var findImage: ((String) -> Void)? { get set }
    var cellSelected: ((IndexPath) -> Void)? { get set }

    func setupDataModel(dataModel: DataModel)
    func tappedCell(indexPath: IndexPath)
    func setProgress(progress:Float, forCellAt indexPath: IndexPath)
    func taskPaused(forCellAt indexPath: IndexPath)
    func taskResumed(forCellAt indexPath: IndexPath)
    func showError(_ error: String)
}

final class CustomView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let anchorConstnats: CGFloat = 16
        static let alertViewConstraint: CGFloat = 150
        static let alertViewHeight: CGFloat = 75
        static let animationDuration:Double = 1
        static let alertViewCornerRadius: CGFloat = 15
    }


    // MARK: - Views

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    lazy var searchContorller: UISearchController={
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        return searchController
    }()

    // MARK: - Properties
    private var tableViewDataSource = CustomTableViewDataSource()
    private var tableViewDelegate: CustomTableViewDelegate?
    var findImage: ((String) -> Void)?
    var cellSelected: ((IndexPath) -> Void)?

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

extension CustomView {
    func setupElements() {
        self.registerTableViewCell()
        overrideUserInterfaceStyle = .light
        self.addSubview(tableView)

        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        self.tableView.tableHeaderView = self.searchContorller.searchBar
    }

    private func registerTableViewCell() {
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseIdentifier)
    }
}

// MARK: - ICustomView

extension CustomView: ICustomView {
    func setupDataModel(dataModel: DataModel) {
        self.tableViewDataSource.dataArray.append(dataModel.image)
        self.tableView.reloadData()
    }

    func tappedCell(indexPath: IndexPath) {
        self.cellSelected?(indexPath)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    func setProgress(progress: Float,forCellAt indexPath:IndexPath) {
        guard let cell = self.tableView.cellForRow(at: indexPath) as? CustomTableViewCell  else {
            assertionFailure("ooops")
            return
        }
        cell.setProrgessView(progress: progress)
    }

    func taskPaused(forCellAt indexPath: IndexPath) {
        guard let cell = self.tableView.cellForRow(at: indexPath) as? CustomTableViewCell  else {
            assertionFailure("ooops")
            return
        }
        cell.setLabelText("Загрузка остановлена")
    }

    func taskResumed(forCellAt indexPath: IndexPath) {
        guard let cell = self.tableView.cellForRow(at: indexPath) as? CustomTableViewCell  else {
            assertionFailure("ooops")
            return
        }
        cell.setLabelText("Загрузка продолжается")
    }

    func showError(_ error: String) {
        DispatchQueue.main.async {
            let alertView = UIView()
            alertView.backgroundColor = .red
            alertView.layer.cornerRadius = Constants.alertViewCornerRadius

            self.addSubview(alertView)

            let alertLabel = UILabel()
            alertLabel.text = "Ошибка,\n\(error)"
            alertLabel.textColor = .black
            alertLabel.numberOfLines = 0
            alertLabel.textAlignment = .center
            alertView.addSubview(alertLabel)

            alertLabel.translatesAutoresizingMaskIntoConstraints = false
            alertView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                alertView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                   constant: Constants.anchorConstnats),
                alertView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                    constant: -Constants.anchorConstnats),
                alertView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: Constants.alertViewConstraint),
                alertView.heightAnchor.constraint(equalToConstant: Constants.alertViewHeight),

                alertLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor),
                alertLabel.topAnchor.constraint(equalTo: alertView.topAnchor),
                alertLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor),
                alertLabel.bottomAnchor.constraint(equalTo: alertView.bottomAnchor),
            ])

            UIView.animate(withDuration: Constants.animationDuration) {
                alertView.transform = CGAffineTransform(translationX: 0, y: -Constants.alertViewConstraint)
            } completion: {_ in
                UIView.animate(withDuration: Constants.animationDuration, delay: Constants.animationDuration) {
                    alertView.transform = CGAffineTransform(translationX: 0, y: 0)
                } completion: { _ in
                    alertView.removeFromSuperview()
                }
            }
        }
    }
}

// MARK: - DataSource и Delegate для tableView

private extension CustomView {
    func setupDelegates() {
        self.tableViewDelegate = CustomTableViewDelegate(withDelegate: self)
        self.tableView.dataSource = tableViewDataSource
        self.tableView.delegate = tableViewDelegate
    }
}

// MARK: - MasterViewControllerDelegate - Обработка тапа на ячейку

extension CustomView: MasterViewControllerDelegate{
    func selectedCell(index: Int) {
        self.tappedCell(indexPath: IndexPath(row: index, section: 0))
    }
}

// MARK: - UISearchResultsUpdating

extension CustomView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // Поиск по мере ввода
        if !searchController.isActive {
            return
        }
    }
}

// MARK: - UISearchBarDelegate

extension CustomView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let filterString = searchBar.text else {
            assertionFailure("Something went wrong")
            return
        }
        self.findImage?(filterString)
        searchBar.resignFirstResponder()
    }
}
