// RouterProtocol.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Протокол роутера
protocol RouterProtocol: RouterMainProtocol {
    func countriesCatalogViewController()
    func showHotelsCatalogViewController(countryName: String)
}
