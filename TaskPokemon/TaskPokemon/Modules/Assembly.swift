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
        let viewModel = PokemonsViewModel(output: output)
        let view = PokemonsViewController(viewModel: viewModel)
        viewModel.view = view

        return view
    }
}
