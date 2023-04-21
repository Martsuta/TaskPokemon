//
//  PokemonInfoViewController.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit
import SnapKit

// MARK: - Input
protocol PokemonInfoViewInput: AnyObject {
    func configure(with model: PokemonInfoModelDTO)
    func configure(with image: UIImage)
    func changeLoading(_ isLoading: Bool)
    func showWarning(with text: String?)
}

// MARK: - PokemonInfoViewController
final class PokemonInfoViewController: UIViewController {

    // MARK: - Constants
    private enum Constants {
        static let navTitle = "Детали"
    }

    // MARK: - SubviewsProperties
    private let avatarImageView = UIImageView()
    private let stackView = UIStackView()
    private let loaderView = UIActivityIndicatorView(style: .large)
    private let warningView = WarningView()

    // MARK: - PrivateProperties
    private let viewModel: PokemonInfoViewModelInput

    // MARK: - Init
    init(viewModel: PokemonInfoViewModelInput) {
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
        viewModel.viewDidLoad()
        setupSubviews()
        setupConstraints()
        setupNavBar()
    }

    // MARK: - PrivateFunctions
    private func setupSubviews() {
        view.backgroundColor = .white

        avatarImageView.contentMode = .center
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 2
        avatarImageView.layer.cornerRadius = 50
        view.addSubview(avatarImageView)

        stackView.axis = .vertical
        stackView.spacing = 12
        view.addSubview(stackView)

        view.addSubview(warningView)
        view.addSubview(loaderView)
    }

    private func setupConstraints() {
        avatarImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
        }

        loaderView.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.centerX.centerY.equalToSuperview()
        }

        warningView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(4)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }

    private func setupNavBar() {
        navigationItem.title = Constants.navTitle

        let backBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(backBarButtonItemTapped)
        )
        navigationItem.leftBarButtonItem = backBarButtonItem
    }

    // MARK: - Actions
    @objc private func backBarButtonItemTapped() {
        viewModel.backBarButtonItemTapped()
    }
}

// MARK: - PokemonInfoViewInput
extension PokemonInfoViewController: PokemonInfoViewInput {
    func configure(with model: PokemonInfoModelDTO) {
        let nameInfoView = PokemonInfoItemView()
        nameInfoView.configure(title: "Имя", text: model.name)
        stackView.addArrangedSubview(nameInfoView)

        let heightInfoView = PokemonInfoItemView()
        heightInfoView.configure(title: "Рост", text: "\(model.height) СМ")
        stackView.addArrangedSubview(heightInfoView)

        let weightInfoView = PokemonInfoItemView()
        weightInfoView.configure(title: "Вес", text: "\(model.weight) КГ")
        stackView.addArrangedSubview(weightInfoView)

        let typesInfoView = PokemonInfoItemView()
        typesInfoView.configure(title: "Типы", text: model.types.map { $0.type.name }.joined(separator: ", "))
        stackView.addArrangedSubview(typesInfoView)
    }

    func configure(with image: UIImage) {
        avatarImageView.image = image
    }

    func changeLoading(_ isLoading: Bool) {
        if isLoading {
            loaderView.startAnimating()
        } else {
            loaderView.stopAnimating()
        }

        loaderView.isHidden = !isLoading
    }

    func showWarning(with text: String?) {
        guard let text = text else { return }

        warningView.show(text: text)
    }
}
