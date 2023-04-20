//
//  PokemonUseCase.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Input
protocol PokemonUseCaseInput {
    func getPokemons(completion: @escaping (Result<PokemonsModelDTO>) -> Void)
}
// MARK: - PokemonUseCase
final class PokemonUseCase {

    // MARK: - PrivateProperties
    private let pokemonService: PokemonService

    // MARK: - Init
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
}
extension PokemonUseCase: PokemonUseCaseInput {
    func getPokemons(completion: @escaping (Result<PokemonsModelDTO>) -> Void) {
        pokemonService.getPokemons { result in
            switch result {
            case .success(let model):
                completion(.success(model.toPokemonsModelDTO()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
