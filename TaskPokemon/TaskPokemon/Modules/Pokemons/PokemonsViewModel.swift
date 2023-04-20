//
//  PokemonsViewModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - Input
protocol PokemonsViewModelInput: AnyObject {}

// MARK: - PokemonsViewModel
final class PokemonsViewModel {

    // MARK: - PublicProperties
    weak var view: PokemonsViewInput?

    // MARK: - PrivateProperties
    private let output: PokemonsOutput

    // MARK: - Init
    init(output: PokemonsOutput) {
        self.output = output
    }
}

// MARK: - PokemonsViewModelInput
extension PokemonsViewModel: PokemonsViewModelInput {}
