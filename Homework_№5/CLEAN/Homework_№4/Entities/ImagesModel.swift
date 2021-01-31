//
//  ImagesModel.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

 class ImagesModel {

    static func getImages(dataModel:DataModel) -> [UIImage] {
        guard let firstImage = UIImage(named: dataModel.firstImageName) else { return [UIImage()] }
        guard let secondImage = UIImage(named: dataModel.secondImageName) else { return [UIImage()] }
        return [firstImage, secondImage]
    }
}
