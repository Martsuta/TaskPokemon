//
//  Assembly.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - Assembly
final class Assembly {
    func makePokemonsScreen(output: PokemonsOutput) -> UIViewController {
        let pokemonUseCase = PokemonUseCase(service: NetworkService())
        let viewModel = PokemonsViewModel(output: output, pokemonUseCase: pokemonUseCase)
        let view = PokemonsViewController(viewModel: viewModel)
        viewModel.view = view

        return view
    }
    
    func makePokemonInfoScreen(output: PokemonInfoOutput) -> (view: UIViewController, input: PokemonInfoInput) {
            let pokemonUseCase = PokemonUseCase(service: NetworkService())
            let viewModel = PokemonInfoViewModel(output: output, pokemonUseCase: pokemonUseCase)
            let view = PokemonInfoViewController(viewModel: viewModel)
            viewModel.view = view

            return (view: view, input: viewModel)
        }
    }
