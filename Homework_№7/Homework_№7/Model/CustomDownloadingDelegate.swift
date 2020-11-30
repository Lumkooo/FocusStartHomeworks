//
//  CusstomDownloadingDelegate.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/29/20.
//

import Foundation

final class CustomDownloadingDelegate: NSObject {

    private weak var delegate: CustomDownloadingDelegateToInteractor?
    private let downloadService = DownloadService()
    private lazy var downloadsSession: URLSession = {
      let configuration = URLSessionConfiguration.background(withIdentifier: ".com.Lumko.Homework_7")
        return URLSession(configuration: configuration,
                        delegate: self,
                        delegateQueue: nil)
    }()

    init(withDelegate delegate: CustomDownloadingDelegateToInteractor) {
        super.init()
        self.delegate = delegate
        self.downloadService.downloadsSession = downloadsSession
    }

    func startLoading(with dataModel: DataModel) {
        if let currentLoadingTask = downloadService.activeDownloads[dataModel.imageURL]{
            if currentLoadingTask.isDownloading{
                // Пауза
                downloadService.pauseDownload(dataModel)
                delegate?.taskPaused(forCellAt: IndexPath(row: dataModel.index,
                                                          section: 0))
            } else {
                // Возобновление
                downloadService.resumeDownload(dataModel)
                delegate?.taskResumed(forCellAt: IndexPath(row: dataModel.index,
                                                           section: 0))
            }
        } else {
            // Загрузка
            downloadService.startDownload(dataModel)
        }
    }

    private func localFilePath(for url: URL) -> URL {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
}

extension CustomDownloadingDelegate: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didFinishDownloadingTo location: URL) {

        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }
        downloadService.activeDownloads[sourceURL] = nil

        let destinationURL = localFilePath(for: sourceURL)
        print("File destination: : ",destinationURL)

        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)

        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch let error {
            print("Не получается сохранить изображение: \(error.localizedDescription)")
        }
    }

    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {

        guard
            let url = downloadTask.originalRequest?.url,
            let download = downloadService.activeDownloads[url]  else {
            return
        }

        download.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)

        DispatchQueue.main.async {
            self.delegate?.reloadUIWithProgress(progress: download.progress,
                                                forCellAt: IndexPath(row: download.dataModel.index,
                                                                     section: 0)
            )
        }
    }
}
