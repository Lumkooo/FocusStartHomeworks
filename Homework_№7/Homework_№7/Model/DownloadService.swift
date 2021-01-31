//
//  DownloadService.swift
//  Homework_№7
//
//  Created by Андрей Шамин on 11/28/20.
//

import UIKit

final class DataTaskService {
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?

    func dataTask(from url: URL, completion: @escaping (UIImage) -> Void) {
        print("Download Started")
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }

            if let error = error {

                // MARK: - Добавить вывод ошибки здесь

                print("DataTask error: " + error.localizedDescription + "\n")
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image ?? UIImage())
                }
            }
        }
        dataTask?.resume()
    }


}
