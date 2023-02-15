// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Билдер
final class Builder: BuilderProtocol {
    // MARK: - Public methods

    func makeCountriesCatalogViewController(router: RouterProtocol) -> UIViewController {
        let viewController = CountriesCatalogViewController()
        let networkService = NetworkService()
        let interactor = CountriesCatalogInteractor(networkService: networkService)
        let presenter = CountriesCatalogPresenter(view: viewController, router: router, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }

    func makeHotelsCatalogViewController(countryName: String, router: RouterProtocol) -> UIViewController {
        let viewController = HotelsCatalogViewController()
        let networkService = NetworkService()
        let interactor = HotelsCatalogInteractor(networkService: networkService)
        let presenter = HotelsCatalogPresenter(
            view: viewController,
            router: router,
            interactor: interactor,
            countryName: countryName
        )
        viewController.presenter = presenter
        return viewController
    }
}
