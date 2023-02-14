// Router.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Роутер
final class Router: RouterProtocol {
    // MARK: - Public Properties

    var navigationController: UINavigationController?
    var builder: BuilderProtocol

    // MARK: - Initializers

    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }

    // MARK: - Public methods

    func countriesCatalogViewController() {
        if let navigationController = navigationController {
            let countriesCatalogViewController = builder.makeCountriesCatalogViewController(router: self)
            navigationController.viewControllers = [countriesCatalogViewController]
        }
    }

    func showHotelsCatalogViewController(countryName: String) {
        if let navigationController = navigationController {
            let hotelsCatalogViewController = builder.makeHotelsCatalogViewController(
                countryName: countryName,
                router: self
            )
            navigationController.pushViewController(hotelsCatalogViewController, animated: true)
        }
    }
}
