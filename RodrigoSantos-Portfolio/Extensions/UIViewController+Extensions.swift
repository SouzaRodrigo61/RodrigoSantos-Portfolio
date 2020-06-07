//
//  UIViewController+Extensions.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 28/05/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}
