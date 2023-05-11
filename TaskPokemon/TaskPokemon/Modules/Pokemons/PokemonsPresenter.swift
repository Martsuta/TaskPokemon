//
//  PokemonsPresenter.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - Input
protocol PokemonsPresenterInput: AnyObject {
    func viewDidLoad()
    func cellWillDisplay(at row: Int)
    func cellTapped(at row: Int)
}

// MARK: - PokemonsPresenter
final class PokemonsPresenter {
    
    // MARK: - PublicProperties
    weak var view: PokemonsViewInput?
    
    // MARK: - PrivateProperties
    private let output: PokemonsOutput
    private let pokemonUseCase: PokemonUseCaseInput
    
    private var pokemonsModels = [PokemonModelDTO]()
    private var pokemonsLink: String? = "https://pokeapi.co/api/v2/pokemon"
    
    // MARK: - Init
    init(output: PokemonsOutput, pokemonUseCase: PokemonUseCaseInput) {
        self.output = output
        self.pokemonUseCase = pokemonUseCase
    }
    
    // MARK: - PrivateFunctions
    private func getPokemons() {
        guard let pokemonsLink = pokemonsLink else { return }
        
        view?.changeLoading(true)
        
        pokemonUseCase.getPokemons(link: pokemonsLink) { [weak self] result in
            
            guard let self else { return }
            
            switch result {
            case .success(let model):
                model.pokemons.forEach { self.pokemonsModels.append($0) }
                self.view?.configure(with: self.pokemonsModels)
                self.view?.changeLoading(false)
                self.pokemonsLink = model.nextLink
            case .failure(let error):
                self.view?.changeLoading(false)
                self.view?.showWarning(with: error)
            }
        }
    }
}

// MARK: - PokemonsPresenterInput
extension PokemonsPresenter: PokemonsPresenterInput {
    func viewDidLoad() {
        getPokemons()
    }

    func cellWillDisplay(at row: Int) {
        guard row == pokemonsModels.count - 1 else { return }
        getPokemons()
    }

    func cellTapped(at row: Int) {
        output.showPokemonInfoScreen(with: pokemonsModels[row].url)
    }
}
