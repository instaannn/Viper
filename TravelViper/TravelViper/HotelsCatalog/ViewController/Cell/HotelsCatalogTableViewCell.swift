// HotelsCatalogTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для отображения отеля
final class HotelsCatalogTableViewCell: UITableViewCell {
    // MARK: - Public Properties

    private lazy var hotelNameLabel = makeHotelNameLabel()
    private lazy var hotelImageView = makeHotelImageView()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public methods

    func configure(hotel: Hotel) {
        hotelNameLabel.text = hotel.name
        hotelImageView.image = UIImage(named: hotel.imageName)
    }
}

// MARK: - SetupUI

private extension HotelsCatalogTableViewCell {
    func setupUI() {
        contentView.addSubview(hotelNameLabel)
        contentView.addSubview(hotelImageView)

        setUpConstraints()
    }

    func setUpConstraints() {
        [
            hotelNameLabel,
            hotelImageView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            hotelImageView.widthAnchor.constraint(equalToConstant: 150),
            hotelImageView.heightAnchor.constraint(equalToConstant: 100),
            hotelImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            hotelImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            hotelImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            hotelNameLabel.leadingAnchor.constraint(
                equalTo: hotelImageView.trailingAnchor,
                constant: 10
            ),
            hotelNameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
            hotelNameLabel.centerYAnchor.constraint(equalTo: hotelImageView.centerYAnchor)
        ])
    }
}

// MARK: - Factory

private extension HotelsCatalogTableViewCell {
    func makeHotelNameLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }

    func makeHotelImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }
}
