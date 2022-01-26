//
//  GifCell+Logic.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/25/22.
//

import UIKit

extension GifCell {
    
    func setup(with gif: GifObject) {
        if let loadedGif = UIImage.gifImageWithURL(gif.images.fixed_height.url.absoluteString) {
            FetchImage.shared.fetchImage(result: gif) { (image) in
                DispatchQueue.main.async {
                    self.gifImageView.image = loadedGif
                }
            }
        }
        title.text = gif.title
    }
}
