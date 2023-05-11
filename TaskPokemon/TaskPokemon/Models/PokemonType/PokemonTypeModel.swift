//
//  PokemonTypeModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonType
struct PokemonTypeModel: Codable {
    let name: String
}

extension PokemonTypeModel {
    func toPokemonTypeModelDTO() -> PokemonTypeModelDTO {
        PokemonTypeModelDTO(name: name)
    }
}
