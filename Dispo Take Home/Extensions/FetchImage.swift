//
//  FetchImage.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/24/22.
//

import UIKit

extension UIImage {

    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
    
        self.init(data: imageData)
    }

}

