//
//  SeparatorView.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class SeparatorView: UIView {
    
    init(){
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Constants.UI.Separator.backgroundColor
        layer.masksToBounds = false
        layer.shadowRadius = Constants.UI.Separator.shadowRadius
        layer.shadowOpacity = Constants.UI.Separator.shadowOpacity
        layer.shadowColor = Constants.UI.Separator.shadowColor
        layer.shadowOffset = Constants.UI.Separator.shadowOffset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
