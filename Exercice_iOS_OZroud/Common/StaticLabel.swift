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
        font = UIFont.systemFont(ofSize: 12)
        textAlignment = .left
        textColor = .black
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
