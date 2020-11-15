//
//  MasterPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation

final class MasterPresenter: ViewToPresenterProtocol {

    // MARK: Properties
    weak var view: MasterViewPresenter?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?

    var dataModel: [DataModel]?

    // MARK: Методы для MasterViewController

    func viewDidLoad(view:MasterViewPresenter) {
        print("MasterPresenter получил уведомление, что MasterViewController загрузился.")
        self.view = view
        self.interactor?.loadDataModel()
        self.view?.didSelectRowAt = { [weak self] indexPath in
            self?.selectCellAt(indexPath: indexPath)
        }
    }

    func selectCellAt(indexPath:IndexPath) {
        self.interactor?.retrieveDataModel(at: indexPath.row)
        self.view?.deselectRowAt(row: indexPath.row)
    }
}

// MARK: - InteractorToPresenterProtocol

extension MasterPresenter: InteractorToPresenterProtocol {

    func fetchSuccess(dataModel: [DataModel]) {
        print("MasterPresenter получил массив dataModel от MasterInteractor.")
        self.dataModel = dataModel
        self.view?.setupDataModel(dataModel: dataModel)
    }

    func getOneDataModel(_ dataModel: DataModel) {
        self.router?.showDetailViewController(on: view!, with: dataModel)
    }
}
