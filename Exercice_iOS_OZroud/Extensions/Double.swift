//
//  Double.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

extension Double {
    
    func formatToPriceCurrency(currencyFormatter: NumberFormatter) -> String? {
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.locale = Locale(identifier: Constants.DateFormat.localIdFR)
        currencyFormatter.numberStyle = .currency
        if let formattedPrice = currencyFormatter.string(from: self as NSNumber? ?? 0.0) {
            return formattedPrice
        }
        return nil
    }
}
