//
//  PokemonInfoIO.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Input
protocol PokemonInfoInput: AnyObject {
    func configure(with pokemonLink: String)
}

// MARK: - Output
protocol PokemonInfoOutput: AnyObject {
    func closePokemonInfoScreen()
}
