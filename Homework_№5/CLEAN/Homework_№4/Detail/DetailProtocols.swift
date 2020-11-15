//
//  DetailProtocols.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

// MARK: Presenter -> View

protocol PresenterToViewDetailProtocol: class {
    func imageSuccess(_ dataModel: DataModel, firstImage: UIImage, secondImage: UIImage)
}

// MARK: View -> Presenter

protocol ViewToPresenterDetailProtocol: class {
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
    func viewDidLoad(view: PresenterToViewDetailProtocol?)
}

// MARK: Presenter -> Interactor

protocol PresenterToInteractorDetailProtocol: class {
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    func getImages()
}

// MARK: Interactor -> Presenter

protocol InteractorToPresenterDetailProtocol: class {
    func getImages(dataModel: DataModel, images:[UIImage])
}

// MARK: Presenter -> Router

protocol PresenterToRouterDetailProtocol: class {
    static func createModule(with dataModel: DataModel) -> UIViewController
}
