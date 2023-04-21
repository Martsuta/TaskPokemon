//
//  NetworkService.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation
import UIKit

// MARK: - NetworkService
final class NetworkService {
    func request<T: Decodable>(_ url: URL?, completion: @escaping (Result<T>) -> Void) {
        if let url = url {
            let request = URLRequest(url: url)

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let response = response as? HTTPURLResponse {
                        completion(.failure(ErrorMessage.getErrorMessage(for: response.statusCode)))
                    }

                    if let data = data, let model = try? JSONDecoder().decode(T.self, from: data) {
                        completion(.success(model))
                    }

                    if let error = error {
                        completion(.failure(error.localizedDescription))
                    }
                }
            }

            task.resume()
        }
    }

    func loadImage(_ url: URL?, completion: @escaping (Result<UIImage>) -> Void) {
        if let url = url {
            let request = URLRequest(url: url)

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if let response = response as? HTTPURLResponse {
                        completion(.failure(ErrorMessage.getErrorMessage(for: response.statusCode)))
                    }

                    if let data = data, let image = UIImage(data: data) {
                        completion(.success(image))
                    }

                    if let error = error {
                        completion(.failure(error.localizedDescription))
                    }
                }
            }

            task.resume()
        }
    }
}
