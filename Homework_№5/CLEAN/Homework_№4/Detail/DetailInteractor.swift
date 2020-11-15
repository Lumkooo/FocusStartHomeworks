//
//  DetailInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation


final class DetailInteractor: PresenterToInteractorDetailProtocol {

    // MARK: Properties
    private let useCaseOne: DetailUseCaseOne
    weak var presenter: InteractorToPresenterDetailProtocol?

    init(useCaseOne: DetailUseCaseOne) {
        self.useCaseOne = useCaseOne
    }


    func getImages() {
        print("DeatilInteractor получил запрос от DetailPresenter на получение изображений.")
        let images = self.useCaseOne.getImages()
        let dataModel = self.useCaseOne.getDataModel()
        self.presenter?.getImages(dataModel: dataModel, images: images)
    }
}
