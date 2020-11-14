//
//  ViewController.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/4/20.
//



import UIKit

class DetailViewController: UIViewController {

    // MARK: -Constants

    private enum Constants {
        static let anchorConstant:CGFloat = 16
        static let imagesAnchorConstant:CGFloat = 32
        static let imagesSize = CGSize(width: 250, height: 250)
        static let cornerRadius:CGFloat = 15
        static let shadowRadius:CGFloat = 10
        static let shadowOpacity:Float = 1
        static let textWidthMultiplier:CGFloat = 0.85
        static let labelNumberOfLines = 0
    }

    // MARK: - Properties
    
    var presenter: ViewToPresenterDetailProtocol?

    // MARK: - Views

    private let textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.labelNumberOfLines
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let viewForFirstImage: UIView = {
        let containerView = UIView()
        containerView.clipsToBounds = false
        containerView.frame.size = CGSize(width: Constants.imagesSize.width,
                                          height: Constants.imagesSize.height)
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = Constants.shadowOpacity
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = Constants.shadowRadius
        containerView.layer.cornerRadius = Constants.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: Constants.cornerRadius).cgPath
        return containerView
    }()

    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.cornerRadius
        return imageView
    }()

    private let viewForSecondImage: UIView = {
        let containerView = UIView()
        containerView.clipsToBounds = false
        containerView.frame.size = CGSize(width: Constants.imagesSize.width,
                                          height: Constants.imagesSize.height)

        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = Constants.shadowOpacity
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = Constants.shadowRadius
        containerView.layer.cornerRadius = Constants.cornerRadius
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: Constants.cornerRadius).cgPath
        return containerView
    }()

    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.cornerRadius
        return imageView
    }()

    // MARK: - Жизненный цикл ViewContorller-а

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        presenter?.viewDidLoad()
    }
}

// MARK: - PresenterToViewDetailProtocol, возвращенные картинки и текст

extension DetailViewController: PresenterToViewDetailProtocol {
    func imageSuccess(_ dataModel: DataModel, firstImage: UIImage, secondImage: UIImage) {
        textLabel.text = dataModel.text
        navigationItem.title = dataModel.heading
        firstImageView.image = firstImage
        secondImageView.image = secondImage
    }
}

// MARK: - UI Setup

extension DetailViewController {

    func setupElements(forIndexPath indexPath: IndexPath = IndexPath(row: 0, section: 0)) {
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        view.addSubview(scrollView)
        setupScrollView()
        setupLabelConstraints()
        setupFirstImageConstraints()
        setupSecondImageConstraints()
    }

    func setupLabelConstraints() {
        scrollView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,
                                           constant: Constants.anchorConstant),
            textLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor,
                                             multiplier: Constants.textWidthMultiplier),
            textLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,
                                               constant: Constants.anchorConstant),
            textLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,
                                                constant: -Constants.anchorConstant),
        ])
    }

    func setupFirstImageConstraints() {
        scrollView.addSubview(viewForFirstImage)
        NSLayoutConstraint.activate([
            viewForFirstImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            viewForFirstImage.widthAnchor.constraint(equalToConstant: Constants.imagesSize.width),
            viewForFirstImage.heightAnchor.constraint(equalToConstant: Constants.imagesSize.height),
            viewForFirstImage.topAnchor.constraint(equalTo: textLabel.bottomAnchor,
                                                   constant: Constants.anchorConstant),
        ])
        viewForFirstImage.addSubview(firstImageView)
        NSLayoutConstraint.activate([
            firstImageView.leadingAnchor.constraint(equalTo: viewForFirstImage.leadingAnchor),
            firstImageView.topAnchor.constraint(equalTo: viewForFirstImage.topAnchor),
            firstImageView.trailingAnchor.constraint(equalTo: viewForFirstImage.trailingAnchor),
            firstImageView.bottomAnchor.constraint(equalTo: viewForFirstImage.bottomAnchor)
        ])
    }

    func setupSecondImageConstraints() {
        scrollView.addSubview(viewForSecondImage)
        NSLayoutConstraint.activate([
            viewForSecondImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            viewForSecondImage.widthAnchor.constraint(equalToConstant: Constants.imagesSize.width),
            viewForSecondImage.heightAnchor.constraint(equalToConstant: Constants.imagesSize.height),
            viewForSecondImage.topAnchor.constraint(equalTo: viewForFirstImage.bottomAnchor,
                                                    constant: Constants.imagesAnchorConstant),
            viewForSecondImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,
                                                       constant: -Constants.imagesAnchorConstant),
        ])
        viewForSecondImage.addSubview(secondImageView)
        NSLayoutConstraint.activate([
            secondImageView.leadingAnchor.constraint(equalTo: viewForSecondImage.leadingAnchor),
            secondImageView.topAnchor.constraint(equalTo: viewForSecondImage.topAnchor),
            secondImageView.trailingAnchor.constraint(equalTo: viewForSecondImage.trailingAnchor),
            secondImageView.bottomAnchor.constraint(equalTo: viewForSecondImage.bottomAnchor)
        ])
    }

    func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor,
                                            constant: Constants.anchorConstant),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
