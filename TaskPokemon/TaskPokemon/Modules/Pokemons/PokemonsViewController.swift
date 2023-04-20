//
//  PokemonsViewController.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit
import SnapKit

// MARK: - Input
protocol PokemonsViewInput: AnyObject {}

// MARK: - PokemonsViewController
final class PokemonsViewController: UIViewController {

    // MARK: - SubviewsProperties
    private let tableView = UITableView()

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
        setupNavBar()
    }

    // MARK: - PrivateFunctions
    private func setupSubviews() {
        view.backgroundColor = .white

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: String(describing: PokemonCell.self))
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - PokemonsViewInput
extension PokemonsViewController: PokemonsViewInput {}

// MARK: - UITableViewDelegate
extension PokemonsViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource
extension PokemonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: PokemonCell.self),
            for: indexPath
        ) as? PokemonCell else { return UITableViewCell() }

        return cell
    }
}
