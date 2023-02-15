// HotelsCatalogPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Презентер экрана каталога отелей
final class HotelsCatalogPresenter: HotelsCatalogPresenterProtocol {
    // MARK: - Public Properties

    var hotels: [Hotel] = []

    // MARK: - Private Properties

    private weak var view: HotelsCatalogViewProtocol?
    private var router: RouterProtocol?
    private var interactor: HotelsCatalogInteractorProtocol?
    private var countryName: String

    // MARK: - Initializers

    init(
        view: HotelsCatalogViewProtocol?,
        router: RouterProtocol,
        interactor: HotelsCatalogInteractorProtocol,
        countryName: String
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.countryName = countryName
    }

    // MARK: - Public methods

    func fetchHotels() {
        interactor?.fetchHotels(countryName: countryName) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(hotels):
                self.hotels = hotels
                self.view?.succes()
            case let .failure(error):
                self.view?.failure(error)
            }
        }
    }
}
