//
//  Constants.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

struct Constants {
    
    struct Tags {
        static let loaderTag: Int = 123456
    }
    
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
    
    struct CategoryAll {
        static let identifier: Int = 0
        static let name: String = "Tout"
    }
    
    struct ItemDetail {
        
        struct Label {
            
            struct Text {
                static let description: String = "Déscription"
                static let category: String = "Catégorie"
                static let price: String = "Prix"
                static let date: String = "Date"
                static let siret: String = "Siret"
            }
            
            struct FontSize {
                static let titleSize: CGFloat = 17.0
                static let normalSize:CGFloat = 14.0
            }
        }
    }
    
}
