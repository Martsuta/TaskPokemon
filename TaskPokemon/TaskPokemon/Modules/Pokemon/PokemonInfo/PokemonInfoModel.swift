//
//  PokemonInfoModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonInfoModel
struct PokemonInfoModel: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: PokemonImagesModel
    let types: [PokemonTypesInfoModel]
}

extension PokemonInfoModel {
    func toPokemonInfoModelDTO() -> PokemonInfoModelDTO {
        PokemonInfoModelDTO(
            name: name,
            height: height,
            weight: weight,
            imageLink: sprites.frontImageLink,
            types: types.map { $0.toPokemonTypesInfoModelDTO() }
        )
    }
}
