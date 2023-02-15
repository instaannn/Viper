// HotelsCatalogPresenterProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол презентера каталога отелей
protocol HotelsCatalogPresenterProtocol {
    var hotels: [Hotel] { get set }

    func fetchHotels()
}
