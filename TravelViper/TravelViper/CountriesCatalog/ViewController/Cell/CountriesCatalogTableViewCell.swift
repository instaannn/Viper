// CountriesCatalogTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для отображения  страны
final class CountriesCatalogTableViewCell: UITableViewCell {
    // MARK: - Public Properties

    private lazy var countryNameLabel = makeCountryNameLabel()
    private lazy var countryImageView = makeCountryImageView()

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public methods

    func configure(country: Country) {
        countryNameLabel.text = country.name
        countryImageView.image = UIImage(named: country.imageName)
    }
}

// MARK: - SetupUI

private extension CountriesCatalogTableViewCell {
    func setupUI() {
        contentView.addSubview(countryNameLabel)
        contentView.addSubview(countryImageView)

        setUpConstraints()
    }

    func setUpConstraints() {
        [
            countryNameLabel,
            countryImageView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            countryImageView.widthAnchor.constraint(equalToConstant: 100),
            countryImageView.heightAnchor.constraint(equalToConstant: 150),
            countryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            countryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            countryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            countryNameLabel.leadingAnchor.constraint(
                equalTo: countryImageView.trailingAnchor,
                constant: 10
            ),
            countryNameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -10
            ),
            countryNameLabel.centerYAnchor.constraint(equalTo: countryImageView.centerYAnchor)
        ])
    }
}

// MARK: - Factory

private extension CountriesCatalogTableViewCell {
    func makeCountryNameLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }

    func makeCountryImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }
}
