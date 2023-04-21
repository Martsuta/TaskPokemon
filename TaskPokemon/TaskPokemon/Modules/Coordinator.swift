//
//  Coordinator.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - Coordinator
final class Coordinator {

    // MARK: - PrivateProperties
    private let assembly: Assembly
    private var navigationController: UINavigationController?

    // MARK: - Init
    init(assembly: Assembly) {
        self.assembly = assembly
    }

    // MARK: - PublicFunctions
    func start(window: UIWindow) {
        let view = assembly.makePokemonsScreen(output: self)
        navigationController = UINavigationController(rootViewController: view)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - PokemonsOutput
extension Coordinator: PokemonsOutput {
    func showPokemonInfoScreen(with pokemonLink: String) {
            let pokemonInfo = assembly.makePokemonInfoScreen(output: self)
            pokemonInfo.input.configure(with: pokemonLink)
            navigationController?.pushViewController(pokemonInfo.view, animated: true)
        }
    }

    // MARK: - PokemonInfoOutput
    extension Coordinator: PokemonInfoOutput {
        func closePokemonInfoScreen() {
            navigationController?.popViewController(animated: true)
        }
    }
