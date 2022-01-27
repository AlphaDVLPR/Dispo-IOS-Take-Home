//
//  DetailViewController+Logic.swift
//  Dispo Take Home
//
//  Created by Ashlyn Loveland on 1/26/22.
//

import Foundation

extension DetailViewController {

    func setup(with gif: GifObject) {
        
        let gifUrl = gif.images.fixed_height.url.absoluteString
        DispatchQueue.main.async {
            self.gifImageView.image = UrlImageModel.init(urlString: gifUrl).image
        }
    }
}
