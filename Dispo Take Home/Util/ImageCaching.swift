//
//  ImageCaching.swift
//  Dispo Take Home
//
//  Created by Ashlyn Loveland on 1/26/22.
//

import UIKit

class UrlImageModel {
    
    var image: UIImage?
    private var urlString: String?
    private var imageCache = ImageCache.getImageCache()
    
    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }
    
    private func loadImage() {
        if loadImageFromCache() {
            return
        }
        
        loadImageFromUrl()
    }
    
    private func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    private func loadImageFromUrl() {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            return
        }
        
        UIImage.gifImageWithURL(url: url) { image in
            guard let img = image else {
                //Alert for error handling
                return }
            self.image = img
            self.imageCache.set(forKey: urlString, image: img)
        }
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        return cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
