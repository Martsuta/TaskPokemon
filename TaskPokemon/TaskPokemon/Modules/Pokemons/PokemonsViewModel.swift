//
//  PokemonsViewModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - Input
protocol PokemonsViewModelInput: AnyObject {
    func viewDidLoad()
}

// MARK: - PokemonsViewModel
final class PokemonsViewModel {

    // MARK: - PublicProperties
    weak var view: PokemonsViewInput?

    // MARK: - PrivateProperties
    private let output: PokemonsOutput
    private let pokemonUseCase: PokemonUseCaseInput

    // MARK: - Init
    init(output: PokemonsOutput, pokemonUseCase: PokemonUseCaseInput) {
            self.output = output
            self.pokemonUseCase = pokemonUseCase
        }
    }

// MARK: - PokemonsViewModelInput
extension PokemonsViewModel: PokemonsViewModelInput {
    func viewDidLoad() {
        pokemonUseCase.getPokemons { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let model):
                self.view?.configure(with: model.pokemons)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
