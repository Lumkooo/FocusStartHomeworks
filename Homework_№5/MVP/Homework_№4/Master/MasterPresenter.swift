//
//  MasterPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

final class MasterPresenter: ViewToPresenterProtocol {

    // MARK: Properties
    
    private var dataModel: [DataModel]?
    weak var ui: MasterViewPresenter?

    // MARK: Методы для MasterViewController

    func viewDidLoad(view:MasterViewPresenter) {
        self.ui = view
        self.loadDataModel()
        self.ui?.didSelectRowAt = { [weak self] indexPath in
            self?.selectCellAt(indexPath: indexPath)
        }
    }
}

private extension MasterPresenter {
    func loadDataModel() {
        self.dataModel = DataModel.getDataModel()
        guard let dataModel = self.dataModel else { fatalError("Something went wrong") }
        self.ui?.setupDataModel(dataModel: dataModel)
    }

    func selectCellAt(indexPath:IndexPath) {
        self.retrieveDataModel(at: indexPath.row)
        self.ui?.deselectRowAt(row: indexPath.row)
    }

    func retrieveDataModel(at index: Int) {
        guard let dataModel = self.dataModel, dataModel.indices.contains(index) else {
            return
        }
        self.getOneDataModel(dataModel[index])
    }

    func getOneDataModel(_ dataModel: DataModel) {
        self.showDetailViewController(on: ui!, with: dataModel)
    }

    func showDetailViewController(on view: MasterViewPresenter, with dataModel: DataModel) {
        let detailViewController = MasterAssembly.createSecondModule(with: dataModel)
        guard let viewController = (view  as? MasterView)?.findViewController() as? MasterViewController else { fatalError("Произошла ошибка!")}
        viewController.splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}
