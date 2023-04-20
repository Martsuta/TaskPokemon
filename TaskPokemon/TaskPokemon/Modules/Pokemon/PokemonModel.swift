//
//  PokemonModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonModel
struct PokemonModel: Codable {
    let name: String
    let url: String?
}

extension PokemonModel {
    func toPokemonModelDTO() -> PokemonModelDTO {
        PokemonModelDTO(name: name, url: url)
    }
}
