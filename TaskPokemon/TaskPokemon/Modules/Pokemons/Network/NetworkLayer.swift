//
//  NetworkLayer.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - NetworkLayer
final class NetworkLayer {
    func request<T: Decodable>(_ endpoint: EndpointProtocol, completion: @escaping (Result<T>) -> Void) {
        if let url = URL(string: endpoint.path, relativeTo: endpoint.baseURL) {
            var request = URLRequest(url: url)
            request.httpMethod = endpoint.method.rawValue
            request.allHTTPHeaderFields = endpoint.headers

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data, let model = try? JSONDecoder().decode(T.self, from: data) {
                        completion(.success(model))
                    }

                    if let error = error {
                        completion(.failure(error))
                    }
                }
            }

            task.resume()
        }
    }
}
