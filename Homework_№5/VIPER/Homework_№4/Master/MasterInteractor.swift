//
//  MasterInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation

protocol IMasterInteractor: class {
    var presenter: IMasterInteractorOutput? { get set }
    
    func loadDataModel()
    func retrieveDataModel(at index: Int)
}

protocol IMasterInteractorOutput: class {
    func fetchSuccess(dataModel: [DataModel])
    func getOneDataModel(_ dataModel: DataModel)
}

final class MasterInteractor {

    // MARK: Properties

    weak var presenter: IMasterInteractorOutput?
    private var dataModel: [DataModel]?
}

// MARK: - IMasterInteractor

extension MasterInteractor: IMasterInteractor {
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
        self.presenter?.getOneDataModel(dataModel[index])
    }
}
