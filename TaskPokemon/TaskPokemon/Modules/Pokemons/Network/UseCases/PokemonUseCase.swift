//
//  PokemonUseCase.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Input
protocol PokemonUseCaseInput {}
// MARK: - PokemonUseCase
final class PokemonUseCase {

    // MARK: - PrivateProperties
    private let pokemonService: PokemonService

    // MARK: - Init
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
}
