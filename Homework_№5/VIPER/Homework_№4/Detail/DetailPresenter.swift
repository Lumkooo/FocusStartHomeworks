//
//  DetailPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

final class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    weak var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?

    func viewDidLoad(view: PresenterToViewDetailProtocol?) {
        print("DetailPresenter уведомлен о том, что DeatilViewController загрузился.")
        self.view = view
        self.interactor?.getImages()
    }

}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    func getImages(dataModel: DataModel, images: [UIImage]) {
        print("DetailPresenter получил результат от DetailInteractor с картинками и экзмепляром DataModel.",dataModel)
        self.view?.imageSuccess(dataModel, firstImage: images[0], secondImage: images[1])
    }
}
