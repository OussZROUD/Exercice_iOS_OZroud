//
//  String.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

extension String {
    
    func formatStringToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.DateFormat.stringToDate
        formatter.calendar = Calendar(identifier: .iso8601)
        guard let date = formatter.date(from: self) else {
            return nil
        }
        return date
    }
}
