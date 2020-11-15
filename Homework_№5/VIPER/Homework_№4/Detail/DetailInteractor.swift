//
//  DetailInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation


final class DetailInteractor: PresenterToInteractorDetailProtocol {

    // MARK: Properties
    weak var presenter: InteractorToPresenterDetailProtocol?
    private var dataModel: DataModel?

    init(dataModel:DataModel?) {
        self.dataModel = dataModel
    }

    func getImages() {
        print("DeatilInteractor получил запрос от DetailPresenter на получение изображений.")
        guard let dataModel = self.dataModel else { fatalError("Что-то плошло не так") }
        let images = ImagesModel.getImages(dataModel: dataModel)
        self.presenter?.getImages(dataModel: dataModel, images: images)
    }
}
