//
//  Download.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/29/20.
//

import UIKit

final class Download {
    var isDownloading = false
    var progress: Float = 0
    var resumeData: Data?
    var task: URLSessionDownloadTask?
    var dataModel: DataModel

    init(dataModel: DataModel) {
      self.dataModel = dataModel
    }
}
