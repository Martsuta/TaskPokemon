//
//  PokemonCell.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit
import SnapKit

// MARK: - Input
protocol PokemonCellInput {
    func configure(with name: String)
}

// MARK: - PokemonCell
final class PokemonCell: UITableViewCell {

    // MARK: - SubviewsProperties
    private let nameLabel = UILabel()
    private let chevronImageView = UIImageView()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupSubviews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - PrivateFunctions
    private func setupSubviews() {
        nameLabel.text = "test pokemon name"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.numberOfLines = .zero
        contentView.addSubview(nameLabel)

        chevronImageView.image = UIImage(systemName: "chevron.right")
        chevronImageView.tintColor = .systemGray4
        chevronImageView.contentMode = .center
        contentView.addSubview(chevronImageView)
    }

    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(12)
        }

        chevronImageView.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(12)
            make.centerY.equalTo(contentView)
            make.trailing.equalToSuperview().inset(12)
            make.size.equalTo(20)
        }
    }
}

// MARK: - PokemonCellInput
extension PokemonCell: PokemonCellInput {
    func configure(with name: String) {
        nameLabel.text = name
    }
}
