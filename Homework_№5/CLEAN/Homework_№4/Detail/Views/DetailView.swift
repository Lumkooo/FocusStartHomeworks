//
//  DetailView.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit


protocol IDetailView: class {
    func imageSuccess(_ dataModel: DataModel, firstImage: UIImage, secondImage: UIImage)
}

final class DetailView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let anchorConstant: CGFloat = 16
        static let imagesAnchorConstant: CGFloat = 32
        static let imagesSize = CGSize(width: 250, height: 250)
        static let cornerRadius: CGFloat = 15
        static let shadowRadius: CGFloat = 10
        static let shadowOpacity: Float = 1
        static let textWidthMultiplier: CGFloat = 0.85
        static let labelNumberOfLines = 0
    }

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

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        self.setupElements()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Методы изменения параметров private UI элементов

extension DetailView: IDetailView {
    func imageSuccess(_ dataModel: DataModel, firstImage: UIImage, secondImage: UIImage) {
        self.textLabel.text = dataModel.text
        self.firstImageView.image = firstImage
        self.secondImageView.image = secondImage
    }
}

// MARK: - Добавление элементов на scrollView и установка constraint-ов для элементов

private extension DetailView {
    func setupElements(forIndexPath indexPath: IndexPath = IndexPath(row: 0, section: 0)) {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        self.setupScrollView()
        self.setupLabelConstraints()
        self.setupFirstImageConstraints()
        self.setupSecondImageConstraints()
    }

    func setupLabelConstraints() {
        self.scrollView.addSubview(self.textLabel)
        NSLayoutConstraint.activate([
            self.textLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: Constants.anchorConstant),
            self.textLabel.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: Constants.textWidthMultiplier),
            self.textLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Constants.anchorConstant),
            self.textLabel.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -Constants.anchorConstant),
        ])
    }

    func setupFirstImageConstraints() {
        self.scrollView.addSubview(self.viewForFirstImage)
        NSLayoutConstraint.activate([
            self.viewForFirstImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.viewForFirstImage.widthAnchor.constraint(equalToConstant: Constants.imagesSize.width),
            self.viewForFirstImage.heightAnchor.constraint(equalToConstant: Constants.imagesSize.height),
            self.viewForFirstImage.topAnchor.constraint(equalTo: self.textLabel.bottomAnchor, constant: Constants.anchorConstant),
        ])
        self.viewForFirstImage.addSubview(self.firstImageView)
        NSLayoutConstraint.activate([
            self.firstImageView.leadingAnchor.constraint(equalTo: self.viewForFirstImage.leadingAnchor),
            self.firstImageView.topAnchor.constraint(equalTo: self.viewForFirstImage.topAnchor),
            self.firstImageView.trailingAnchor.constraint(equalTo: self.viewForFirstImage.trailingAnchor),
            self.firstImageView.bottomAnchor.constraint(equalTo: self.viewForFirstImage.bottomAnchor)
        ])
    }

    func setupSecondImageConstraints() {
        self.scrollView.addSubview(self.viewForSecondImage)
        NSLayoutConstraint.activate([
            self.viewForSecondImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.viewForSecondImage.widthAnchor.constraint(equalToConstant: Constants.imagesSize.width),
            self.viewForSecondImage.heightAnchor.constraint(equalToConstant: Constants.imagesSize.height),
            self.viewForSecondImage.topAnchor.constraint(equalTo: self.viewForFirstImage.bottomAnchor, constant: Constants.imagesAnchorConstant),
            self.viewForSecondImage.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -Constants.imagesAnchorConstant),
        ])
        self.viewForSecondImage.addSubview(self.secondImageView)
        NSLayoutConstraint.activate([
            self.secondImageView.leadingAnchor.constraint(equalTo: self.viewForSecondImage.leadingAnchor),
            self.secondImageView.topAnchor.constraint(equalTo: self.viewForSecondImage.topAnchor),
            self.secondImageView.trailingAnchor.constraint(equalTo: self.viewForSecondImage.trailingAnchor),
            self.secondImageView.bottomAnchor.constraint(equalTo: self.viewForSecondImage.bottomAnchor)
        ])
    }

    func setupScrollView() {
        NSLayoutConstraint.activate([
            self.scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.anchorConstant),
            self.scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
