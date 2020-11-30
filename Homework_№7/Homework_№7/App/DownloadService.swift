//
//  DownloadService.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/29/20.
//

import UIKit

final class DownloadService {
    var activeDownloads: [URL:Download] = [:]
    var downloadsSession: URLSession!

    func cancelDownload(_ dataModel: DataModel) {
      guard let download = activeDownloads[dataModel.imageURL] else {
        return
      }
      download.task?.cancel()
      activeDownloads[dataModel.imageURL] = nil
    }

    func pauseDownload(_ dataModel: DataModel) {
      guard
        let download = activeDownloads[dataModel.imageURL],
        download.isDownloading
        else {
          return
      }
      download.task?.cancel(byProducingResumeData: { data in
        download.resumeData = data
      })
      download.isDownloading = false
    }

    func resumeDownload(_ dataModel: DataModel) {
      guard let download = activeDownloads[dataModel.imageURL] else {
        return
      }
      if let resumeData = download.resumeData {
        download.task = downloadsSession.downloadTask(withResumeData: resumeData)
      } else {
        download.task = downloadsSession.downloadTask(with: download.dataModel.imageURL)
      }
      download.task?.resume()
      download.isDownloading = true
    }

    func startDownload(_ dataModel: DataModel) {
        let download = Download(dataModel: dataModel)
        download.task = downloadsSession.downloadTask(with: dataModel.imageURL)
        download.task?.resume()
        download.isDownloading = true
        self.activeDownloads[dataModel.imageURL] = download
    }
}
