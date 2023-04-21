//
//  PokemonsViewController.swift
//  TaskPokemon
//
//  Created by Ирина Марцута on 20.04.23.
//

import UIKit
import SnapKit

// MARK: - Input
protocol PokemonsViewInput: AnyObject {
    func configure(with models: [PokemonModelDTO])
    func changeLoading(_ isLoading: Bool)
    func showWarning(with text: String?)
}

// MARK: - PokemonsViewController
final class PokemonsViewController: UIViewController {
    
    // MARK: - SubviewsProperties
    private let tableView = UITableView()
    private let loaderView = UIActivityIndicatorView(style: .large)
    private let warningView = WarningView()
    
    
    
    // MARK: - PrivateProperties
    private let viewModel: PokemonsViewModelInput
    
    private var models = [PokemonModelDTO]()
    
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
        viewModel.viewDidLoad()
        setupSubviews()
        setupConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - PrivateFunctions
    private func setupSubviews() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: String(describing: PokemonCell.self))
        view.addSubview(tableView)
        
        view.addSubview(warningView)
        view.addSubview(loaderView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
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
}

// MARK: - PokemonsViewInput
extension PokemonsViewController: PokemonsViewInput {
    func configure(with models: [PokemonModelDTO]) {
        self.models = models
        tableView.reloadData()
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

// MARK: - UITableViewDelegate
extension PokemonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.cellWillDisplay(at: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellTapped(at: indexPath.row)
    }
}


// MARK: - UITableViewDataSource
extension PokemonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: PokemonCell.self),
            for: indexPath
        ) as? PokemonCell else { return UITableViewCell() }
        
        cell.configure(with: models[indexPath.row].name)

        return cell
    }
}
