//
//  DataModel.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/29/20.
//

import UIKit

final class DataModel {
    let index: Int
    let image: UIImage
    let imageURL: URL

    init(index: Int, image: UIImage, imageURL: URL) {
        self.index = index
        self.image = image
        self.imageURL = imageURL
    }
}
