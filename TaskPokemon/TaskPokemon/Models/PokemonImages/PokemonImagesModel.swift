//
//  PokemonImagesModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonImagesModel
struct PokemonImagesModel: Codable {
    let frontImageLink: String

    private enum CodingKeys: String, CodingKey {
        case frontImageLink = "front_default"
    }
}
