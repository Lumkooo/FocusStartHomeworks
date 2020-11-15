//
//  ViewController.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//



import UIKit

final class DetailViewController: UIViewController {


    // MARK: - Properties
    
    var presenter: ViewToPresenterDetailProtocol?
    private var detailView = DetailView()

    // MARK: - Жизненный цикл ViewContorller-а

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailView
        self.presenter?.viewDidLoad(view: self.detailView)
    }
}
