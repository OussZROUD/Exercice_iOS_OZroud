//
//  CommonLabel.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class CommonLabel: UILabel {
    
    init( font: UIFont, color: UIColor, alignment: NSTextAlignment){
        super.init(frame: .zero)
        self.font = font
        textColor = color
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = alignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
