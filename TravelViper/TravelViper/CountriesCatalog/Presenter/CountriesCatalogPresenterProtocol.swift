// CountriesCatalogPresenterProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол презентера каталога фильмов
protocol CountriesCatalogPresenterProtocol {
    var countries: [Country] { get set }

    func fetchCountries()
    func selectCountry(countryName: String)
}
