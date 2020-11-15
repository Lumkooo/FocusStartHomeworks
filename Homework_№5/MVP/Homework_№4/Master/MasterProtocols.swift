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
    var ui: MasterViewPresenter? { get set }
    func viewDidLoad(view:MasterViewPresenter)
}
