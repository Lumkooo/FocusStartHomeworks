//
//  MasterUseCaseOne.swift
//  Homework_№5_CLEAN
//
//  Created by Андрей Шамин on 11/15/20.
//

import Foundation

protocol IMasterUseCaseOne: AnyObject {
    func loadDataModel() -> [DataModel]
    func retrieveDataModel(at index: Int) -> DataModel
}

final class MasterUseCaseOne {
    private var dataModel:[DataModel]?
}

// MARK: - IMasterUseCaseOne

extension MasterUseCaseOne: IMasterUseCaseOne {
    func loadDataModel() -> [DataModel] {
        let dataModel = DataModel.getDataModel()
        self.dataModel = dataModel
        return dataModel
    }

    func retrieveDataModel(at index: Int) -> DataModel {
        guard let oneDataModel = self.dataModel?[index] else {
            fatalError("Не удалось получить один элемент массива dataModel")
        }
        return oneDataModel
    }
}
