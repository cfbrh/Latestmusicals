//
//  ModelData.swift
//  LatestMusicals
//
//  Created by 张 on 2024/7/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var latestmusicals: [Latestmusical] = load("latestmusicalData.json")
    var profile = Profile.default
    
    var features: [Latestmusical] {
        latestmusicals.filter { $0.isFeature }
    }

    var categories: [String: [Latestmusical]] {
        Dictionary(
            grouping: latestmusicals,
            by: { $0.category.rawValue }
        )
    }
}

var latestmusicals: [Latestmusical] = load("latestmusicalData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch let decodingError as DecodingError {
        switch decodingError {
        case .typeMismatch(let type, let context):
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case .valueNotFound(let type, let context):
            print("Value '\(type)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case .keyNotFound(let key, let context):
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        case .dataCorrupted(let context):
            print("Data corrupted:", context.debugDescription)
            print("codingPath:", context.codingPath)
        @unknown default:
            print("Unknown error:", decodingError.localizedDescription)
        }
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(decodingError)")
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
