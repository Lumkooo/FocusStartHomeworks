//
//  MainProtocols.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit


// MARK: Presenter -> View

protocol MasterViewPresenter: class {
    var didSelectRowAt:((IndexPath) -> Void)? { get set }
    func setupDataModel(dataModel:[DataModel])
    func deselectRowAt(row: Int)
}

// MARK: View -> Presenter

protocol ViewToPresenterProtocol: class {
    var view: MasterViewPresenter? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func viewDidLoad(view:MasterViewPresenter)
    func selectCellAt(indexPath:IndexPath)
}

// MARK: Presenter -> Interactor

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? { get set }
    func loadDataModel()
    func retrieveDataModel(at index: Int)
}

// MARK: Interactor -> Presenter

protocol InteractorToPresenterProtocol: class {
    func fetchSuccess(dataModel: [DataModel])
    func getOneDataModel(_ dataModel: DataModel)
}

// MARK: Presenter -> Router

protocol PresenterToRouterProtocol: class {
    func showDetailViewController(on view: MasterViewPresenter, with dataModel: DataModel)
    static func createModule() -> UISplitViewController
}
