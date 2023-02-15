// HotelsCatalogInteractor.swift
// Copyright © RoadMap. All rights reserved.

/// Интерактор экрана каталога отелей
final class HotelsCatalogInteractor: HotelsCatalogInteractorProtocol {
    // MARK: - Private properties

    private let networkService: NetworkServiceProtocol?

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    // MARK: - Public methods

    func fetchHotels(countryName: String, _ completion: @escaping (Result<[Hotel], Error>) -> Void) {
        networkService?.fetchHotels(countryName: countryName, completion)
    }
}
