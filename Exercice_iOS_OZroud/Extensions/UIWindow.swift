//
//  UIWindow.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 29/3/2022.
//  Copyright © 2022 Oussama Zroud. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
