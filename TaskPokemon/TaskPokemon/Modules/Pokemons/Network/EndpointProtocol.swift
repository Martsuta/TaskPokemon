//
//  EndpointProtocol.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Types
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

typealias HTTPHeaders = [String: String]

// MARK: - EndpointProtocol
protocol EndpointProtocol {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: [String: Any]? { get }
}

extension EndpointProtocol {
    var baseURL: URL? {
        return URL(string: "https://pokeapi.co/api/v2/")!
    }

    var headers: [String: String]? {
        return [:]
    }

    var parameters: [String: Any]? {
        return [:]
    }
}
