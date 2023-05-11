//
//  PokemonInfoModelDTO.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - PokemonInfoModelDTO
struct PokemonInfoModelDTO {
    let name: String
    let height: Int
    let weight: Int
    let imageLink: String
    let types: [PokemonTypesInfoModelDTO]
}
