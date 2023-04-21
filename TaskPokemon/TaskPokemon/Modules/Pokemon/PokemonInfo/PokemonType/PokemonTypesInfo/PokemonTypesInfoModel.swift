//
//  PokemonTypesInfoModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonTypesInfoModel
struct PokemonTypesInfoModel: Codable {
    let type: PokemonTypeModel
}

extension PokemonTypesInfoModel {
    func toPokemonTypesInfoModelDTO() -> PokemonTypesInfoModelDTO {
        PokemonTypesInfoModelDTO(type: type.toPokemonTypeModelDTO())
    }
}
