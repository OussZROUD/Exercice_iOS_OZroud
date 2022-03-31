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
    
    struct ListItem {
        
        struct SafeArea {
            static let identifier: String = "safeArea"
            static let widthConstant: CGFloat = -10.0
            static let heightConstant: CGFloat = -20.0
        }
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
                static let normalSize: CGFloat = 14.0
                static let staticLabelSize: CGFloat = 12.0
                static let categoryLabelCellSize: CGFloat = 10.0
            }
            
        }
        
        struct emptyValue{
            static let siret = "non indiquer"
        }
        
    }
    
    struct Alert {
        static let textButton: String = "OK"
        static let textTitle: String = "Une erreur s'est produite"
        static let textMessage: String = "Veullez Vérifiez votre accés internet"
    }
    
    struct ImageAssets {
        static let placeHolder: String = "placeholder-Image"
    }
    
    struct UI {
        
        static let labelNumberOflines: Int = 0
        
        struct Separator {
            static let backgroundColor: UIColor = UIColor.systemGroupedBackground
            static let shadowRadius: CGFloat = 2.0
            static let shadowOpacity: Float = 0.5
            static let shadowColor: CGColor = UIColor.gray.cgColor
            static let shadowOffset: CGSize = CGSize(width: 0, height: 1)
        }
    }
    
    struct ItemCollectionCell{
        struct Label {
            static let textSize: CGFloat = 12.0
            static let alignment: NSTextAlignment = .left
        }
    }
    
    struct Cell {
        static let backgroundColor: UIColor = UIColor.clear
        static let shadowColor: CGColor = UIColor.gray.cgColor
        static let shadowOffset: CGSize = CGSize(width: 2.0, height: 4.0)
        static let shadowOpacity: Float = 1.0
        static let borderWidth: CGFloat = 1.0
    }
}
