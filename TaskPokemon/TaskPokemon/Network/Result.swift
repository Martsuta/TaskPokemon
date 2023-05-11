//
//  Result.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - Result
enum Result<Model> {
    case success(Model)
    case failure(String?)
}
