// CountriesCatalogViewProtocol.swift
// Copyright © RoadMap. All rights reserved.

/// Протокол каталога стран для сеньоров помидоров
protocol CountriesCatalogViewProtocol: AnyObject {
    func succes()
    func failure(_ error: Error)
}
