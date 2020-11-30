//
//  CustomInteractor.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

protocol ICustomInteractor: class {
    func loadDataModel(withURL url: URL)
    func cellSelected(indexPath: IndexPath)
}

protocol ICustomInteractorOuter: class {
    func dataModelForTableView(dataModel: DataModel)
    func setProgress(progress: Float, forCellAt indexPath: IndexPath)
    func taskPaused(forCellAt indexPath: IndexPath)
    func taskResumed(forCellAt indexPath: IndexPath)
    func errorOccuredWithImage(error: String)
}

protocol CustomDownloadingDelegateToInteractor: class {
    func reloadUIWithProgress(progress: Float, forCellAt indexPath: IndexPath)
    func taskPaused(forCellAt indexPath: IndexPath)
    func taskResumed(forCellAt indexPath: IndexPath)
}


final class CustomInteractor {
    weak var presenter: ICustomInteractorOuter?
    private let dataTaskService = DataTaskService()
    private var dataArray: [DataModel] = []
    private var customDownloadingDelegate: CustomDownloadingDelegate?

    init() {
        self.customDownloadingDelegate = CustomDownloadingDelegate(withDelegate: self)
    }
}

extension CustomInteractor: ICustomInteractor {

    func cellSelected(indexPath: IndexPath) {
        let dataModel = dataArray[indexPath.row]
        self.customDownloadingDelegate?.startLoading(with: dataModel)
    }

    func loadDataModel(withURL url: URL) {
        if self.dataArray.contains(where: {$0.imageURL == url}) {
            self.presenter?.errorOccuredWithImage(error: "У вас уже имеется такое изображение в списке")
            return
        }

        dataTaskService.dataTask(from: url) { [weak self] (image) in
            let dataModel = DataModel(index: self?.dataArray.count ?? 0,image: image, imageURL: url)
            self?.dataArray.append(dataModel)
            self?.presenter?.dataModelForTableView(dataModel: dataModel)
        } errorCompletion: { [weak self] (error) in
            self?.presenter?.errorOccuredWithImage(error: error.localizedDescription)
        }
    }
}

extension CustomInteractor: CustomDownloadingDelegateToInteractor {
    func taskPaused(forCellAt indexPath: IndexPath) {
        self.presenter?.taskPaused(forCellAt: indexPath)
    }

    func taskResumed(forCellAt indexPath: IndexPath) {
        self.presenter?.taskResumed(forCellAt: indexPath)
    }

    func reloadUIWithProgress(progress: Float, forCellAt indexPath: IndexPath) {
        self.presenter?.setProgress(progress: progress, forCellAt: indexPath)
    }
}
