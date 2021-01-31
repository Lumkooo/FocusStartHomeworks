//
//  MasterPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

protocol IMasterPresenter: class {
    func viewDidLoad(view:IMasterView)
}

final class MasterPresenter: IMasterPresenter {

    // MARK: Properties
    
    private var dataModel: [DataModel]?
    var ui: IMasterView?

    // MARK: Методы для MasterViewController
    func viewDidLoad(view: IMasterView) {
        self.ui = view
        self.loadDataModel()
        self.ui?.didSelectRowAt = { [weak self] index in
            self?.selectCellAt(index: index)
        }
    }
}

private extension MasterPresenter {
    func loadDataModel() {
        self.dataModel = DataModel.getDataModel()
        guard let dataModel = self.dataModel else {
            fatalError("Something went wrong")
        }
        self.ui?.setupDataModel(dataModel: dataModel)
    }

    func selectCellAt(index: Int) {
        self.retrieveDataModel(at: index)
        self.ui?.deselectRowAt(indexPath: IndexPath(row: index, section: 0))
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

    func showDetailViewController(on view: IMasterView, with dataModel: DataModel) {
        let detailViewController = DetailAssembly.createDetailController(with: dataModel)
        guard let viewController = (view  as? MasterView)?.findViewController() else {
            fatalError("Произошла ошибка!")
        }
        viewController.splitViewController?.showDetailViewController(detailViewController, sender: nil)
    }
}
