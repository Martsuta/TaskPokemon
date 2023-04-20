//
//  PokemonEndpoint.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonEndpoint
enum PokemonEndpoint: EndpointProtocol {
    case pokemons(Int, Int)

    var path: String {
        switch self {
        case .pokemons:
            return "pokemon"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .pokemons:
            return .get
        }
    }
}
