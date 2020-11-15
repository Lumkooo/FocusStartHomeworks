//
//  DetailPresenter.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

final class DetailPresenter: ViewToPresenterDetailProtocol {

    // MARK: Properties
    weak var ui: PresenterToViewDetailProtocol?
    private var dataModel:DataModel?

    // MARK: - Init

    init(dataModel:DataModel?) {
        self.dataModel = dataModel
    }

    // MARK: - ViewDidLoad для PresenterToViewDetailProtocol

    func viewDidLoad(view: PresenterToViewDetailProtocol?) {
        self.ui = view
        self.getImages()
    }

    private func getImages() {
        guard let dataModel = self.dataModel else { fatalError("Что-то плошло не так") }
        let images = ImagesModel.getImages(dataModel: dataModel)
        self.ui?.imageSuccess(dataModel, firstImage: images[0], secondImage: images[1])
    }
}
