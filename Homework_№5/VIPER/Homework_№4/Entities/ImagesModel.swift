//
//  ImagesModel.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/13/20.
//

import UIKit

 class ImagesModel {

    private enum Images: Int {
        case firstImage = 0
        case secondImage = 1
        case thirdImage = 2
        case fourthImage = 3
        case fifthImage = 4
        case sixthImage = 5

        var image: UIImage {
            switch self {
            case  .firstImage:
                return UIImage(named: "firstImage") ?? UIImage()
            case  .secondImage:
                return UIImage(named: "secondImage") ?? UIImage()
            case  .thirdImage:
                return UIImage(named: "thirdImage") ?? UIImage()
            case  .fourthImage:
                return UIImage(named: "fourthImage") ?? UIImage()
            case  .fifthImage:
                return UIImage(named: "fifthImage") ?? UIImage()
            case  .sixthImage:
                return UIImage(named: "sixthImage") ?? UIImage()
            }
        }
    }

    static func getImages(dataModel:DataModel) -> [UIImage] {
        guard let firstImage = Images.init(rawValue: 2)?.image else { return [UIImage()] }
        guard let secondImage = Images.init(rawValue: 3)?.image else { return [UIImage()] }
        return [firstImage, secondImage]
    }
}
