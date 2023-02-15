// BuilderProtocol.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Протокол билдера
protocol BuilderProtocol {
    func makeCountriesCatalogViewController(router: RouterProtocol) -> UIViewController
    func makeHotelsCatalogViewController(countryName: String, router: RouterProtocol) -> UIViewController
}
