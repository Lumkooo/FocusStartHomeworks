//
//  DetailInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

protocol IDetailInteractor: class {
    var presenter: IDetailInteractorOutput? { get set }
    func getImages()
}

protocol IDetailInteractorOutput: class {
    func getImages(dataModel: DataModel, images:[UIImage])
}

final class DetailInteractor {

    // MARK: Properties

    weak var presenter: IDetailInteractorOutput?
    private var dataModel: DataModel

    // MARK: - Init

    init() {
        // Создал этот инициализатор для той ситуации, когда SplitViewController должен
        // сразу показать DetailViewController и MasterViewControler
        // Этот Init дает первый экземпляр DataModel для отображения
        // в DetailViewController-е
        self.dataModel = DataModel.getFirstDataModel()
    }

    init(dataModel: DataModel) {
        self.dataModel = dataModel
    }
}

// MARK: - IDetailInteractor

extension DetailInteractor: IDetailInteractor {
    func getImages() {
        print("DeatilInteractor получил запрос от DetailPresenter на получение изображений.")
        let images = ImagesModel.getImages(dataModel: self.dataModel)
        self.presenter?.getImages(dataModel: dataModel, images: images)
    }
}
