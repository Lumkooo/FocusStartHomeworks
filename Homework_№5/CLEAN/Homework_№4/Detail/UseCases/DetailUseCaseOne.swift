//
//  DetailUseCaseOne.swift
//  Homework_№5_CLEAN
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

protocol IDetailUseCaseOne: AnyObject {
    func getDataModel() -> DataModel
    func getImages() -> [UIImage]
}

final class DetailUseCaseOne {

    private enum Constants {
        static let error = "Что-то плошло не так"
    }

    private var dataModel:DataModel?

    init(dataModel:DataModel?) {
        self.dataModel = dataModel
    }

    init() {
        self.dataModel = DataModel.getFirstDataModel()
    }
}

// MARK: - IDetailUseCaseOne

extension DetailUseCaseOne: IDetailUseCaseOne {
    func getImages() -> [UIImage] {
        guard let dataModel = self.dataModel else {
            fatalError(Constants.error)
        }
        let images = ImagesModel.getImages(dataModel: dataModel)
        return images
    }

    func getDataModel() -> DataModel {
        guard let dataModel = self.dataModel else {
            fatalError(Constants.error)
        }
        return dataModel
    }
}
