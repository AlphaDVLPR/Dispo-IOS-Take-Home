//
//  GifCell+Logic.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/25/22.
//

import UIKit

extension GifCell {
    
    func setup(with gif: GifObject) {
        
        let gifUrl = gif.images.fixed_height.url.absoluteString
        DispatchQueue.main.async {
            self.gifImageView.image = UrlImageModel.init(urlString: gifUrl).image
        }
        title.text = gif.title
    }
}
