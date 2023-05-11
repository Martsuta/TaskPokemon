//
//  PokemonsModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonsModel
struct PokemonsModel: Codable {
    let pokemons: [PokemonModel]
    let nextLink: String?
    
    private enum CodingKeys: String, CodingKey {
        case pokemons = "results"
        case nextLink = "next"
    }
}

extension PokemonsModel {
    func toPokemonsModelDTO() -> PokemonsModelDTO {
        PokemonsModelDTO(pokemons: pokemons.map { $0.toPokemonModelDTO() }, nextLink: nextLink)
    }
}
