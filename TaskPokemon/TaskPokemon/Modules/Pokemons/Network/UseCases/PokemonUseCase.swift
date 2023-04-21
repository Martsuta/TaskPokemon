//
//  PokemonUseCase.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation
import UIKit

// MARK: - Input
protocol PokemonUseCaseInput {
    func getPokemons(link: String, completion: @escaping (Result<PokemonsModelDTO>) -> Void)
        func getPokemonInfo(link: String, completion: @escaping (Result<PokemonInfoModelDTO>) -> Void)
        func getPokemonImage(link: String, completion: @escaping (Result<UIImage>) -> Void)
    }

// MARK: - PokemonUseCase
final class PokemonUseCase {

    // MARK: - PrivateProperties
    private let service: NetworkService

    // MARK: - Init
    init(service: NetworkService) {
            self.service = service
        }
    }
    
extension PokemonUseCase: PokemonUseCaseInput {
    func getPokemons(link: String, completion: @escaping (Result<PokemonsModelDTO>) -> Void) {
        service.request(URL(string: link)) { (result: Result<PokemonsModel>) in
            switch result {
            case .success(let model):
                completion(.success(model.toPokemonsModelDTO()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getPokemonInfo(link: String, completion: @escaping (Result<PokemonInfoModelDTO>) -> Void) {
            service.request(URL(string: link)) { (result: Result<PokemonInfoModel>) in
                switch result {
                case .success(let model):
                    completion(.success(model.toPokemonInfoModelDTO()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }

        func getPokemonImage(link: String, completion: @escaping (Result<UIImage>) -> Void) {
            service.loadImage(URL(string: link)) { (result: Result<UIImage>) in
                switch result {
                case .success(let image):
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
