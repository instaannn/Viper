// NetworkService.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Сетевой слой
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Public methods

    func fetchCountries(_ completion: @escaping ((Result<[Country], Error>) -> Void)) {
        let countries = Country.getCountries()
        if !countries.isEmpty {
            completion(.success(countries))
        } else {
            let error = NSError(domain: S.Error.nil, code: 0)
            completion(.failure(error))
        }
    }

    func fetchHotels(countryName: String, _ completion: @escaping (Result<[Hotel], Error>) -> Void) {
        let hotels = Hotel.getHotels().filter { $0.countryName == countryName }
        if !hotels.isEmpty {
            completion(.success(hotels))
        } else {
            let error = NSError(domain: S.Error.nil, code: 0)
            completion(.failure(error))
        }
    }
}
