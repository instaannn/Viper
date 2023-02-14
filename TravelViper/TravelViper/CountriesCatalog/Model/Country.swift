// Country.swift
// Copyright © RoadMap. All rights reserved.

/// Страна
struct Country {
    /// Название
    let name: String
    /// Картинка
    let imageName: String

    static func getCountries() -> [Country] {
        let countries: [Country] = [
            .init(name: "Bali", imageName: I.bali.name),
            .init(name: "Dubai", imageName: I.dubai.name),
            .init(name: "Las Vegas", imageName: I.lasVegas.name),
            .init(name: "New Zealand", imageName: I.newZealand.name),
            .init(name: "Thailand", imageName: I.thailand.name),
            .init(name: "Vietnam", imageName: I.vietnam.name)
        ]
        return countries
    }
}
