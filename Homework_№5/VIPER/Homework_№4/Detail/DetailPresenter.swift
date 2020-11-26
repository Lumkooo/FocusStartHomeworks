//
//  DetailPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

protocol IDetailPresenter: class {
    var ui: IDetailView? { get set }

    func viewDidLoad(view: IDetailView?)
}

final class DetailPresenter {

    // MARK: Properties

    weak var ui: IDetailView?
    private var interactor: IDetailInteractor
    private var router: IDetailRouter

    // MARK: - Init

    init(interactor:IDetailInteractor, router:IDetailRouter) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - IDetailPresenter

extension DetailPresenter: IDetailPresenter {
    func viewDidLoad(view: IDetailView?) {
        print("DetailPresenter уведомлен о том, что DeatilViewController загрузился.")
        self.interactor.presenter = self
        self.ui = view
        self.interactor.getImages()
    }
}

// MARK: - IDetailInteractorOutput

extension DetailPresenter: IDetailInteractorOutput {
    func getImages(dataModel: DataModel, images: [UIImage]) {
        print("DetailPresenter получил результат от DetailInteractor с картинками и экзмепляром DataModel.")
        self.ui?.imageSuccess(dataModel, firstImage: images[0], secondImage: images[1])
    }
}
