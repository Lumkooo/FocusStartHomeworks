//
//  MasterInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation


class MasterInteractor: PresenterToInteractorProtocol {

    // MARK: Properties

    weak var presenter: InteractorToPresenterProtocol?
    var dataModel: [DataModel]?

    func loadDataModel() {
        print("MasterInteractor получил запрос от MasterPresenter загрузить данные( в нашем случае из локального JSON.")
        self.dataModel = DataModel.getDataModel()
        guard let dataModel = self.dataModel else { return }
        self.presenter?.fetchSuccess(dataModel: dataModel)
    }

    func retrieveDataModel(at index: Int) {
        guard let dataModel = self.dataModel, dataModel.indices.contains(index) else {
            return
        }
        self.presenter?.getSuccess(dataModel[index])
    }
}
