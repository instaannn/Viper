// CountriesCatalogPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер экрана отелей
final class CountriesCatalogPresenter: CountriesCatalogPresenterProtocol {
    // MARK: - Public Properties

    var countries: [Country] = []

    // MARK: - Private Properties

    private weak var view: CountriesCatalogViewProtocol?
    private var router: RouterProtocol?
    private var interactor: CountriesCatalogInteractorProtocol?

    // MARK: - Initializers

    init(
        view: CountriesCatalogViewProtocol?,
        router: RouterProtocol,
        interactor: CountriesCatalogInteractorProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }

    // MARK: - Public methods

    func fetchCountries() {
        interactor?.fetchCountries { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(countries):
                self.countries = countries
                self.view?.succes()
            case let .failure(error):
                self.view?.failure(error)
            }
        }
    }

    func selectCountry(countryName: String) {
        router?.showHotelsCatalogViewController(countryName: countryName)
    }
}
