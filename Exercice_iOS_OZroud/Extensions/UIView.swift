//
//  UIView.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

extension UIView {
    func startLoader(activityColor: UIColor, backgroundColor: UIColor) {
        
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = Constants.Tags.loaderTag
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.color = activityColor
            activityIndicator.startAnimating()
            self.isUserInteractionEnabled = false
            backgroundView.addSubview(activityIndicator)
            self.addSubview(backgroundView)
    }
    
    func stopLoader() {
            if let background = self.viewWithTag(Constants.Tags.loaderTag){
                background.removeFromSuperview()
            }
            self.isUserInteractionEnabled = true
    }
}
