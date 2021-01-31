//
//  ViewController.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//



import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Properties
    
    var presenter: IDetailPresenteeer
    var detailView = DetailView()

    // MARK: - Init

    init(presenter: IDetailPresenteeer) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Жизненный цикл ViewContorller-а

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        self.presenter.viewDidLoad(view: self.detailView)
    }
}
