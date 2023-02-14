// Hotel.swift
// Copyright © RoadMap. All rights reserved.

/// Отель
struct Hotel {
    /// Страна
    let countryName: String
    /// Название
    let name: String
    /// Картинка
    let imageName: String

    static func getHotels() -> [Hotel] {
        let hotels: [Hotel] = [
            .init(countryName: "Bali", name: "MaxOne Rejuvination", imageName: I.maxOne.name),
            .init(countryName: "Bali", name: "Pristine Villa Yuyu Balian", imageName: I.pristine.name),
            .init(
                countryName: "Dubai",
                name: "Luxury JBR Shams · Full Sea View · Free 5* Beach Resorts Access!",
                imageName: I.shams.name
            ),
            .init(
                countryName: "Las Vegas",
                name: "Holiday Inn Club Vacations at Desert Club Resort, an IHG Hotel",
                imageName: I.desert.name
            ),
            .init(
                countryName: "Las Vegas",
                name: "Virgin Hotels Las Vegas, Curio Collection by Hilton",
                imageName: I.virgin.name
            ),
            .init(countryName: "New Zealand", name: "Paparoa Park Motel", imageName: I.paparoa.name),
            .init(countryName: "Thailand", name: "Kaomai Lanna Resort", imageName: I.kaomai.name),
            .init(countryName: "Thailand", name: "Paradise KohYao - SHA Extra Plus", imageName: I.kohYao.name),
            .init(countryName: "Vietnam", name: "Mekong Lodge Resort", imageName: I.mekong.name)
        ]
        return hotels
    }
}
