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
        let pokemonUseCase = PokemonUseCase(pokemonService: PokemonService())
        let viewModel = PokemonsViewModel(output: output, pokemonUseCase: pokemonUseCase)
        let view = PokemonsViewController(viewModel: viewModel)
        viewModel.view = view

        return view
    }
}
