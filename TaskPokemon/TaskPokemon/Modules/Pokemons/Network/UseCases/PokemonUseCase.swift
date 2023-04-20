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
    private let networkService: NetworkService

    // MARK: - Init
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

// MARK: - PokemonUseCaseInput
extension PokemonUseCase: PokemonUseCaseInput {}
