//
//  MasterInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation


//final class MasterInteractor: PresenterToInteractorProtocol {
//
//    // MARK: Properties
//
//    private let useCaseOne: MasterUseCaseOne
//    weak var presenter: InteractorToPresenterProtocol?
//
//    init(useCaseOne: MasterUseCaseOne) {
//        self.useCaseOne = useCaseOne
//    }
//
//    func loadDataModel() {
//        print("MasterInteractor получил запрос от MasterPresenter загрузить данные( в нашем случае из локального JSON.")
//        let loadedDataModel = self.useCaseOne.loadDataModel()
//        self.presenter?.fetchSuccess(dataModel: loadedDataModel)
//    }
//
//    func retrieveDataModel(at index: Int) {
//        let oneDataModel = self.useCaseOne.retrieveDataModel(at: index)
//        self.presenter?.getOneDataModel(oneDataModel)
//    }
//}

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
    private let useCaseOne: MasterUseCaseOne

    init(useCaseOne: MasterUseCaseOne) {
        self.useCaseOne = useCaseOne
    }

}

// MARK: - IMasterInteractor

extension MasterInteractor: IMasterInteractor {
    func loadDataModel() {
        print("MasterInteractor получил запрос от MasterPresenter загрузить данные( в нашем случае из локального JSON.")
        let loadedDataModel = self.useCaseOne.loadDataModel()
        self.presenter?.fetchSuccess(dataModel: loadedDataModel)
    }

    func retrieveDataModel(at index: Int) {
        let oneDataModel = self.useCaseOne.retrieveDataModel(at: index)
        self.presenter?.getOneDataModel(oneDataModel)
    }
}
