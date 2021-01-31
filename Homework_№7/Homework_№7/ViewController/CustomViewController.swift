//
//  ViewController.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

class CustomViewController: UIViewController {

    // тесты: https://d279m997dpfwgl.cloudfront.net/wp/2020/03/kelly-sikkema-mSoM8rDzhfE-unsplash-1000x662.jpg
    // Загрузка заметна на: https://cdn.britannica.com/85/102885-050-FB0F1BFB/Cape-Cod-Massachusetts.jpg

    // MARK: - Views

    private let customView = CustomView()
    
    // MARK: - Properties

    private let presenter: ICustomPresenter

    // MARK: - Init

    init(presenter: ICustomPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = customView
        presenter.viewDidLoad(ui: self.customView)
        self.title = "ДЗ 7"
    }
}

