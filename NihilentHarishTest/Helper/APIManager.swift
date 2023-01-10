//
//  APIManager.swift
//  NihilentHarishTest
//
//  Created by BrainAbove on 09/01/23.
//

import UIKit

// Singleton Design Pattern

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}
// Handler
typealias Handler = (Result<[Product], DataError>) -> Void

final class APIManager {

    static let shared = APIManager()
    private init() {}

    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.APIURL) else {
            completion(.failure(.invalidURL))
            return
        }
        // Background task
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let productDict = try JSONDecoder().decode(ProductsData.self, from: data)
                let prodcutArray = productDict.products ?? []
                completion(.success(prodcutArray))
            }catch {
                completion(.failure(.network(error)))
            }

        }.resume()
        print("End..")
    }
    
}
