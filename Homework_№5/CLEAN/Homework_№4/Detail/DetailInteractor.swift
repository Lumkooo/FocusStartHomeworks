//
//  DetailInteractor.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit


//final class DetailInteractor: PresenterToInteractorDetailProtocol {
//
//    // MARK: Properties
//    private let useCaseOne: DetailUseCaseOne
//    weak var presenter: InteractorToPresenterDetailProtocol?
//
//    init(useCaseOne: DetailUseCaseOne) {
//        self.useCaseOne = useCaseOne
//    }
//
//    func getImages() {
//        print("DeatilInteractor получил запрос от DetailPresenter на получение изображений.")
//        let images = self.useCaseOne.getImages()
//        let dataModel = self.useCaseOne.getDataModel()
//        self.presenter?.getImages(dataModel: dataModel, images: images)
//    }
//}

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
    private let useCaseOne: DetailUseCaseOne

    // MARK: - Init

    init(useCaseOne: DetailUseCaseOne) {
        self.useCaseOne = useCaseOne
    }

    init() {
        // Создал этот инициализатор для той ситуации, когда SplitViewController должен
        // сразу показать DetailViewController и MasterViewControler
        // Этот Init дает первый экземпляр DataModel для отображения
        // в DetailViewController-е
        self.useCaseOne = DetailUseCaseOne()
    }
}

// MARK: - IDetailInteractor

extension DetailInteractor: IDetailInteractor {
    func getImages() {
        print("DeatilInteractor получил запрос от DetailPresenter на получение изображений.")
        let images = self.useCaseOne.getImages()
        let dataModel = self.useCaseOne.getDataModel()
        self.presenter?.getImages(dataModel: dataModel, images: images)
    }
}

