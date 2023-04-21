//
//  PokemonInfoViewModel.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Input
protocol PokemonInfoViewModelInput: AnyObject {
    func viewDidLoad()
    func backBarButtonItemTapped()
}

// MARK: - PokemonInfoViewModel
final class PokemonInfoViewModel {

    // MARK: - PublicProperties
    weak var view: PokemonInfoViewInput?

    // MARK: - PrivateProperties
    private let output: PokemonInfoOutput
    private let pokemonUseCase: PokemonUseCaseInput

    private var pokemonLink = ""

    // MARK: - Init
    init(output: PokemonInfoOutput, pokemonUseCase: PokemonUseCaseInput) {
        self.output = output
        self.pokemonUseCase = pokemonUseCase
    }

    // MARK: - PrivateFunctions
    private func fetchImage(with link: String) {
        pokemonUseCase.getPokemonImage(link: link) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let image):
                self.view?.configure(with: image)
                self.view?.changeLoading(false)
            case .failure(let error):
                self.view?.showWarning(with: error)
                self.view?.changeLoading(false)
            }
        }
    }
}

// MARK: - PokemonInfoViewModelInput
extension PokemonInfoViewModel: PokemonInfoViewModelInput {
    func viewDidLoad() {
        view?.changeLoading(true)

        pokemonUseCase.getPokemonInfo(link: pokemonLink) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let model):
                self.view?.configure(with: model)
                self.fetchImage(with: model.imageLink)
            case .failure(let error):
                self.view?.changeLoading(false)
                self.view?.showWarning(with: error)
            }
        }
    }

    func backBarButtonItemTapped() {
        output.closePokemonInfoScreen()
    }
}

// MARK: - PokemonInfoInput
extension PokemonInfoViewModel: PokemonInfoInput {
    func configure(with pokemonLink: String) {
        self.pokemonLink = pokemonLink
    }
}
