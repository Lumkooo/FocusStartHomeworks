//
//  OnePersonViewController.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import UIKit

final class OnePersonViewController: UIViewController {

    // MARK: - Views

    let onePersonView = OnePersonView()

    // MARK: - Properties

    let presenter: IOnePersonPresenter

    // MARK: - Init

    init(presenter: IOnePersonPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.onePersonView
        self.presenter.viewDidLoad(ui: self.onePersonView)
    }
}
