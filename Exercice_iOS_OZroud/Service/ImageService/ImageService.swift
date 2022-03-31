//
//  ImageService.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 27/3/2022.
//  Copyright © 2022 Oussama Zroud. All rights reserved.
//

import Foundation
import UIKit

final class ImageService {
    
    // MARK: - Public API
    private static var imageCache = NSCache<AnyObject, AnyObject>()
    
    func image(for url: URL, completion: @escaping (UIImage?) -> Void) -> Cancellable {
        
        var image: UIImage?
        if let image = ImageService.imageCache.object(forKey: url as AnyObject) as? UIImage {
            completion(image)
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            
            if let data = data {
                // Create Image from Data
                image = UIImage(data: data)
                guard let imageToCache = image else { return }
                ImageService.imageCache.setObject(imageToCache, forKey: url as AnyObject)
            }
            
            DispatchQueue.main.async {
                // Execute Handler
                completion(image)
            }
        }
        
        // Resume Data Task
        dataTask.resume()
        
        return dataTask
    }
    
}
