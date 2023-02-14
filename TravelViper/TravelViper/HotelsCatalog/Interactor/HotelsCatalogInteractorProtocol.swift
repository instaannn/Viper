// HotelsCatalogInteractorProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол для интерактора экрана каталога отелей
protocol HotelsCatalogInteractorProtocol {
    func fetchHotels(countryName: String, _ completion: @escaping (Result<[Hotel], Error>) -> Void)
}
