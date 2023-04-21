//
//  PokemonInfoItemView.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit
import SnapKit

// MARK: - Input
protocol PokemonInfoItemViewInput {
    func configure(title: String, text: String)
}

// MARK: - PokemonInfoItemView
final class PokemonInfoItemView: UIView {

    // MARK: - SubviewsProperties
    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let textLabel = UILabel()
    private let bottomLineView = UIView()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - PrivateFunctions
    private func setupSubviews() {
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)

        titleLabel.textColor = .systemGray2
        titleLabel.font = .systemFont(ofSize: 12)
        stackView.addArrangedSubview(titleLabel)

        textLabel.textColor = .darkGray
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.numberOfLines = .zero
        stackView.addArrangedSubview(textLabel)

        bottomLineView.backgroundColor = .black
        stackView.addArrangedSubview(bottomLineView)
    }

    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        bottomLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
}

// MARK: - PokemonInfoItemViewInput
extension PokemonInfoItemView: PokemonInfoItemViewInput {
    func configure(title: String, text: String) {
        titleLabel.text = title
        textLabel.text = text
    }
}
