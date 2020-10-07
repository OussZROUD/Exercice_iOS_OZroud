//
//  UIViewController.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            let alertController = UIAlertController(title: title, message:
                message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: Constants.Alert.textButton, style: .default, handler: {action in }))
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
}
