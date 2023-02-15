// CountriesCatalogInteractor.swift
// Copyright © RoadMap. All rights reserved.

/// Интерактор экрана каталога стран
final class CountriesCatalogInteractor: CountriesCatalogInteractorProtocol {
    // MARK: - Private properties

    private let networkService: NetworkServiceProtocol?

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    // MARK: - Public methods

    func fetchCountries(_ completion: @escaping (Result<[Country], Error>) -> Void) {
        networkService?.fetchCountries(completion)
    }
}
