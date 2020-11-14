//
//  MainProtocols.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit


// MARK: Presenter -> View

protocol MasterViewPresenter: class {
    func returnDataModel()
    func deselectRowAt(row: Int)
}

// MARK: View -> Presenter

protocol ViewToPresenterProtocol: class {
    var view: MasterViewPresenter? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    var dataModel: [DataModel]? { get set }
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func dataModelForCell(indexPath: IndexPath) -> DataModel?
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)
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
    func getSuccess(_ dataModel: DataModel)
}

// MARK: Presenter -> Router

protocol PresenterToRouterProtocol: class {
    func showDetailViewController(on view: MasterViewPresenter, with dataModel: DataModel)
    static func createModule() -> UISplitViewController
}
