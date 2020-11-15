//
//  MasterViewControllerDelegate.swift
//  Homework_№5_VIPER
//
//  Created by Андрей Шамин on 11/15/20.
//

import UIKit

protocol MasterViewControllerDelegate: class {
    func selectedCell(indexPath: IndexPath)
}
