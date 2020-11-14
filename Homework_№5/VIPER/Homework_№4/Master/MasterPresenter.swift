//
//  MasterPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation

class MasterPresenter: ViewToPresenterProtocol {

    // MARK: Properties
    weak var view: MasterViewPresenter?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?

    var dataModel: [DataModel]?

    // MARK: Методы для MasterViewController
    func viewDidLoad() {
        print("MasterPresenter получил уведомление, что MasterViewController загрузился.")
        interactor?.loadDataModel()
    }

    func numberOfRowsInSection() -> Int {
        guard let dataModel = self.dataModel else {
            return 0
        }
        return dataModel.count
    }

    func dataModelForCell(indexPath: IndexPath) -> DataModel? {
        guard let dataModel = self.dataModel else {
            return nil
        }
        return dataModel[indexPath.row]
    }

    func didSelectRowAt(index: Int) {
        interactor?.retrieveDataModel(at: index)
    }

    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
}

// MARK: - InteractorToPresenterProtocol

extension MasterPresenter: InteractorToPresenterProtocol {

    func fetchSuccess(dataModel: [DataModel]) {
        print("MasterPresenter получил массив dataModel от MasterInteractor.")
        self.dataModel = dataModel
        view?.returnDataModel()
    }

    func getSuccess(_ dataModel: DataModel) {
        router?.showDetailViewController(on: view!, with: dataModel)
    }
}
