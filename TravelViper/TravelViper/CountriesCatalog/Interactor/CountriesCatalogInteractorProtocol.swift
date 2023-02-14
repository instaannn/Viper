// CountriesCatalogInteractorProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол для интерактора экрана каталога стран
protocol CountriesCatalogInteractorProtocol {
    func fetchCountries(_ completion: @escaping (Result<[Country], Error>) -> Void)
}
