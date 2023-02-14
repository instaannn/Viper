// HotelsCatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран каталога отелей выбранной страны
final class HotelsCatalogViewController: UIViewController {
    // MARK: - Private visual Components

    private lazy var tableView = makeTableView()

    // MARK: - Public Properties

    var presenter: HotelsCatalogPresenterProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }
}

// MARK: - HotelsCatalogViewProtocol

extension HotelsCatalogViewController: HotelsCatalogViewProtocol {
    func succes() {
        tableView.reloadData()
    }

    func failure(_ error: Error) {
        showAlert(title: S.Action.title, message: error.localizedDescription)
    }
}

// MARK: - UITableViewDataSource

extension HotelsCatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.hotels.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: S.Hotel.cellIdentifier
        ) as? HotelsCatalogTableViewCell else { return UITableViewCell() }
        guard let hotels = presenter?.hotels else { return UITableViewCell() }
        cell.configure(hotel: hotels[indexPath.row])
        return cell
    }
}

// MARK: - SetupUI

private extension HotelsCatalogViewController {
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
        presenter?.fetchHotels()
    }
}

// MARK: - Factory

private extension HotelsCatalogViewController {
    func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(HotelsCatalogTableViewCell.self, forCellReuseIdentifier: S.Hotel.cellIdentifier)
        tableView.dataSource = self
        return tableView
    }
}
