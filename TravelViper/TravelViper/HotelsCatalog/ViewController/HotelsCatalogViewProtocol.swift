// HotelsCatalogViewProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол каталога отелей
protocol HotelsCatalogViewProtocol: AnyObject {
    func succes()
    func failure(_ error: Error)
}
