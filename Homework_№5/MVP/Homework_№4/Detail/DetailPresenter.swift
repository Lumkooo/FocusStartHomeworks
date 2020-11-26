//
//  DetailPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//


import UIKit

protocol IDetailPresenteeer: class {
    var ui: IDetailView? { get set }
    
    func viewDidLoad(view: IDetailView?)
}

final class DetailPresenter: IDetailPresenteeer {

    // MARK: Properties
    weak var ui: IDetailView?
    private var dataModel:DataModel?

    // MARK: - Init

    init(dataModel:DataModel?) {
        self.dataModel = dataModel
    }

    init() {
        self.dataModel = DataModel.getFirstDataModel()
    }

    // MARK: - ViewDidLoad для PresenterToViewDetailProtocol

    func viewDidLoad(view: IDetailView?) {
        self.ui = view
        self.getImages()
    }

    private func getImages() {
        guard let dataModel = self.dataModel else {
            fatalError("Что-то плошло не так")
        }
        let images = ImagesModel.getImages(dataModel: dataModel)
        self.ui?.imageSuccess(dataModel, firstImage: images[0], secondImage: images[1])
    }
}
