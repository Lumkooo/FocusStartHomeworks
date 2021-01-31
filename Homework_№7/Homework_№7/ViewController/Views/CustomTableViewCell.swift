//
//  CustomTableViewCell.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

    // MARK: - Constants

    private enum Constants {
        static let anchorConstnats: CGFloat = 24
        static let imageSize = CGSize(width: 150, height: 150)
    }

    // MARK: - Properties
    static var reuseIdentifier: String {
        return String(describing: CustomTableViewCell.self)
    }

    // MARK: - Views

    private let myImageView = UIImageView()
    private let myLabel:UILabel={
        let myLabel = UILabel()
        myLabel.numberOfLines = 0
        myLabel.text = "Нажмите на ячейку для загрузки"
        return myLabel
    }()

    private let progressView:UIProgressView={
        let progressView = UIProgressView()
        progressView.progress = 0
        return progressView
    }()

    // MARK: - Метод для конфигурации TableViewCell извне

    func setupCell(image:UIImage) {
        self.myImageView.image = image
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupElements()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setProrgessView(progress: Float) {
        self.progressView.progress = progress
        if progress == 1.0 {
            self.setLabelText("Готово!")
        } else if progress > 0 && progress < 1.0 {
            self.setLabelText("Загружается!")
        } else {
            self.setLabelText("Нажмите на ячейку для загрузки")
        }
    }

    func setLabelText(_ text: String) {
        self.myLabel.text = text
    }
}

// MARK: - Добавление элементов на ContentView и добавление их Constraint-ов

private extension CustomTableViewCell {
    func setupElements() {
        self.setupImageView()
        self.setupDownloadButton()
        self.setupProgressView()
    }

    func setupImageView() {
        self.contentView.addSubview(self.myImageView)
        self.myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: Constants.anchorConstnats),
            self.myImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                      constant: Constants.anchorConstnats),
            self.myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                      constant: -Constants.anchorConstnats),
            self.myImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize.height),
            self.myImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize.width)
        ])
    }

    func setupDownloadButton() {
        self.contentView.addSubview(self.myLabel)
        self.myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.myLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                              constant: Constants.anchorConstnats),
            self.myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -Constants.anchorConstnats),
            self.myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                      constant: -Constants.anchorConstnats),
            self.myLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

    func setupProgressView() {
        self.contentView.addSubview(self.progressView)
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                      constant: Constants.anchorConstnats),
            self.progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                 constant: -4),
            self.progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                      constant: -Constants.anchorConstnats),
        ])
    }
}
