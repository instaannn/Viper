// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экстеншен для универсального алерта
extension UIViewController {
    // MARK: - Public methods

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: S.Action.buttonTitle, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}
