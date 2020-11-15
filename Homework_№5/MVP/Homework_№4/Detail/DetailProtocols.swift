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
    var ui: PresenterToViewDetailProtocol? { get set }
    func viewDidLoad(view: PresenterToViewDetailProtocol?)
}
