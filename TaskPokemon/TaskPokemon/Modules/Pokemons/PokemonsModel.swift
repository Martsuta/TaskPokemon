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

    private enum CodingKeys: String, CodingKey {
        case pokemons = "results"
    }
}

extension PokemonsModel {
    func toPokemonsModelDTO() -> PokemonsModelDTO {
        PokemonsModelDTO(pokemons: pokemons.map { $0.toPokemonModelDTO() })
    }
}
