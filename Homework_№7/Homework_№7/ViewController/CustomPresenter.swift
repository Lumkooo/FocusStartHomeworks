//
//  ICustomViewPresenter.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

protocol ICustomPresenter: class {
    func viewDidLoad(ui:ICustomView)
}

final class CustomPresenter {
    private var interactor: ICustomInteractor
    private weak var ui: ICustomView?

    init(interactor: ICustomInteractor) {
        self.interactor = interactor
    }
}

// MARK: - ICustomPresenter

extension CustomPresenter: ICustomPresenter {
    func viewDidLoad(ui: ICustomView) {
        self.ui = ui
        // Превоначальная загрузка картинки (Отображение в TableView)
        self.ui?.findImage = { [weak self] stringURL in
            guard let url = URL(string: stringURL) else {
                self?.ui?.showError("Прозошла ошибка в преобразовании к URL-у")
                return
            }
            self?.interactor.loadDataModel(withURL: url)
        }

        // Ячейка нажата - загрука/остановка загрузки/возобновление загрузки
        self.ui?.cellSelected = { [weak self] indexPath in
            self?.interactor.cellSelected(indexPath: indexPath)
        }
    }

    private func selectCellAt(index: Int) {
        self.ui?.tappedCell(indexPath: IndexPath(row: index, section: 0) )
    }
}

// MARK: - ICustomInteractorOuter

extension CustomPresenter: ICustomInteractorOuter {
    func errorOccuredWithImage(error: String) {
        self.ui?.showError(error)
    }

    func taskPaused(forCellAt indexPath: IndexPath) {
        self.ui?.taskPaused(forCellAt: indexPath)
    }

    func taskResumed(forCellAt indexPath: IndexPath) {
        self.ui?.taskResumed(forCellAt: indexPath)
    }

    func setProgress(progress: Float, forCellAt indexPath: IndexPath) {
        self.ui?.setProgress(progress: progress, forCellAt: indexPath)
    }

    func dataModelForTableView(dataModel: DataModel) {
        self.ui?.setupDataModel(dataModel: dataModel)
    }
}
