//
//  ItemDetailsAdapterProtocol.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/6/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import Foundation

protocol ItemDetailsAdapterProtocol {
    func adapteItemDetails(item: Item, category: Category) -> ItemDetailsViewController.ViewModel
}
