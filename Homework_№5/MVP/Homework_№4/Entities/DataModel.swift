//
//  DataModel.swift
//  Homework_№4
//
//  Created by Андрей Шамин on 11/6/20.
//

import Foundation

struct DataModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case heading, text, time
    }

    let heading:String
    let text:String
    let time:String

}

extension DataModel {
    static func getDataModel() -> [DataModel] {
        var jsonData:[DataModel] = []
        if let path = Bundle.main.path(forResource: "dataModel", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode([DataModel].self, from: data)
            } catch {
                print(error)
            }
        }
        return jsonData
    }

    static func getFirstDataModel() -> DataModel {
        return DataModel.getDataModel()[0]
    }
}


