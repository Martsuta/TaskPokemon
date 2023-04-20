//
//  PokemonService.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - PokemonService
final class PokemonService {

    // MARK: - PrivateProperties
    private let networkLayer = NetworkLayer()

    // MARK: - PublicFunctions
    func getPokemons(completion: @escaping (Result<PokemonsModel>) -> Void) {
        networkLayer.request(PokemonEndpoint.pokemons(20, 20)) { (result: Result<PokemonsModel>) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
