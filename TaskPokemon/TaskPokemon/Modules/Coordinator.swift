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
//        navigationController?.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

// MARK: - PokemonsOutput
extension Coordinator: PokemonsOutput {}
