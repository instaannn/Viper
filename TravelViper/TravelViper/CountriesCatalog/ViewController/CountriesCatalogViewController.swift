// CountriesCatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран каталога стран для сеньоров помидоров
final class CountriesCatalogViewController: UIViewController {
    // MARK: - Private visual Components

    private lazy var tableView = makeTableView()

    // MARK: - Public Properties

    var presenter: CountriesCatalogPresenterProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }

    // MARK: - Private methods

    private func goToHotelsCatalogViewController(countryName: String) {
        presenter?.selectCountry(countryName: countryName)
    }
}

// MARK: - CountriesCatalogViewProtocol

extension CountriesCatalogViewController: CountriesCatalogViewProtocol {
    func succes() {
        tableView.reloadData()
    }

    func failure(_ error: Error) {
        showAlert(title: S.Action.title, message: error.localizedDescription)
    }
}

// MARK: - UITableViewDataSource

extension CountriesCatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.countries.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: S.Countries.cellIdentifier
        ) as? CountriesCatalogTableViewCell else { return UITableViewCell() }
        guard let countries = presenter?.countries else { return UITableViewCell() }
        cell.configure(country: countries[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CountriesCatalogViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToHotelsCatalogViewController(countryName: presenter?.countries[indexPath.row].name ?? "")
    }
}

// MARK: - SetupUI

private extension CountriesCatalogViewController {
    func setupUI() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setupBinding() {
        presenter?.fetchCountries()
    }
}

// MARK: - Factory

private extension CountriesCatalogViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(CountriesCatalogTableViewCell.self, forCellReuseIdentifier: S.Countries.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }
}
