//
//  MasterPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import Foundation

protocol IMasterPresenter: class {
    func viewDidLoad(view: IMasterView)
    func selectCellAt(index: Int)
}

final class MasterPresenter {

    // MARK: Properties
    weak var ui: IMasterView?
    private var interactor: IMasterInteractor
    private var router: IMasterRouter

    init(interactor:IMasterInteractor, router: IMasterRouter) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: IMasterPresenter

extension MasterPresenter: IMasterPresenter {

    func viewDidLoad(view:IMasterView) {
        print("MasterPresenter получил уведомление, что MasterViewController загрузился.")
        self.ui = view
        self.interactor.loadDataModel()
        self.ui?.didSelectRowAt = { [weak self] index in
            self?.selectCellAt(index: index)
        }
    }

    func selectCellAt(index:Int) {
        self.interactor.retrieveDataModel(at: index)
        self.ui?.deselectRowAt(indexPath: IndexPath(row: index, section: 0) )
    }
}

// MARK: - IMasterInteractorOutput

extension MasterPresenter: IMasterInteractorOutput {
    func fetchSuccess(dataModel: [DataModel]) {
        print("MasterPresenter получил массив dataModel от MasterInteractor.")
        self.ui?.setupDataModel(dataModel: dataModel)
    }

    func getOneDataModel(_ dataModel: DataModel) {
        guard let ui = self.ui else {
            assertionFailure("Somethingn is wrong")
            return
        }
        self.router.showDetailViewController(on: ui, with: dataModel)
    }
}
