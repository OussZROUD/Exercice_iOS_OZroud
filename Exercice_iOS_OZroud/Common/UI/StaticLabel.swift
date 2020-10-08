//
//  StaticLabel.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class StaticLabel: UILabel {
    
    init(text:String){
        super.init(frame: .zero)
        self.text = text
        font = UIFont.systemFont(ofSize: Constants.ItemDetail.Label.FontSize.staticLabelSize)
        textAlignment = .left
        textColor = .black
        numberOfLines = Constants.UI.labelNumberOflines
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
