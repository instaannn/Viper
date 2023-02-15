// NetworkServiceProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол сетевого слоя
protocol NetworkServiceProtocol {
    func fetchCountries(_ completion: @escaping ((Result<[Country], Error>) -> Void))
    func fetchHotels(countryName: String, _ completion: @escaping (Result<[Hotel], Error>) -> Void)
}
