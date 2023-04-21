//
//  PokemonsIO.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Input
protocol PokemonsInput: AnyObject {}

// MARK: - Output
protocol PokemonsOutput: AnyObject {
    func showPokemonInfoScreen(with pokemonLink: String)
   }
