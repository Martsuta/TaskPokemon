//
//  PokemonsViewController.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit

// MARK: - Input
protocol PokemonsViewInput: AnyObject {}

// MARK: - PokemonsViewController
final class PokemonsViewController: UIViewController {

    // MARK: - PrivateProperties
    private let viewModel: PokemonsViewModelInput

    // MARK: - Init
    init(viewModel: PokemonsViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - PrivateFunctions
    private func setupSubviews() {
        view.backgroundColor = .red
    }

    private func setupConstraints() {}
}

// MARK: - PokemonsViewInput
extension PokemonsViewController: PokemonsViewInput {}
