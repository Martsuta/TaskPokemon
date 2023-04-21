//
//  ErrorMessage.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import Foundation

// MARK: - ErrorMessage
enum ErrorMessage {
    static func getErrorMessage(for statusCode: Int) -> String? {
        switch statusCode {
        case (400...499):
            return "Client error"
        case (500...599):
            return "Server error"
        default:
            return nil
        }
    }
}
