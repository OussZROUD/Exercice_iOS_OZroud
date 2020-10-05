//
//  Constants.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Network {
        static let baseUrl: String = "https://raw.githubusercontent.com/leboncoin/paperclip/master/"
        static let productEndPoint: String = "listing.json"
        static let categoryEndPoint: String = "categories.json"
    }
    
    struct ViewControllerTitle {
        static let listItem: String = "ARTICLES"
        static let detailItem: String = "DÉTAILS ARTICLE"
    }
    
    struct Buttons {
        static let navBarBackButton = "Retour"
    }
    
    struct CellID {
        static let categoryCell: String = "categoryCell"
        static let productCell: String = "itemCell"
    }
    
    struct DateFormat {
        static let stringToDate: String = "yyyy-MM-dd'T'HH:mm:ssZ"
        static let localIdFR: String = "FR-fr"
    }
    
}
