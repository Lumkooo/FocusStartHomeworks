//
//  ITableViewDataSource.swift
//  Homework_№8
//
//  Created by Андрей Шамин on 12/6/20.
//

import Foundation

protocol ITableViewDataSource: class {
    func cellRemoved(indexPath : IndexPath)
}
