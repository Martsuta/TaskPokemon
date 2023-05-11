//
//  WarningView.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit
import SnapKit

// MARK: - Input
protocol WarningViewInput {
    func show(text: String)
    func hide()
}

// MARK: - WarningView
final class WarningView: UIView {
    
    // MARK: - Constants
    private enum Constants {
        static var cornerRadius: CGFloat { 6 }
        static var fontSize: CGFloat { 10 }
        static var textLabelEdgesSpacing: Int { 16 }
    }
    
    // MARK: - SubviewsProperties
    private let textLabel = UILabel()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
        setupGestures()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - PrivateFunctions
    private func setupSubviews() {
        isHidden = true
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = .systemRed

        textLabel.textColor = .white
        textLabel.font = .systemFont(ofSize: Constants.fontSize)
        textLabel.numberOfLines = .zero
        addSubview(textLabel)
    }

    private func setupConstraints() {
        textLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(Constants.textLabelEdgesSpacing)
        }
    }

    private func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
    }

    // MARK: - Actions
    @objc private func viewTapped() {
        isHidden = true
    }
}

// MARK: - WarningViewInput
extension WarningView: WarningViewInput {
    func show(text: String) {
        textLabel.text = text
        isHidden = false
    }

    func hide() {
        isHidden = true
    }
}
