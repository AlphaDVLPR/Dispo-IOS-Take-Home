//
//  FetchImage.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/24/22.
//

import Foundation

struct FetchImage {
    
    static let shared = FetchImage()
    
    //Fetch Image
    static func fetchImage(result: GifObject, completion: @escaping (UIImage?) -> Void) {
        
        //Start the URL Session
        URLSession.shared.dataTask(with: result.images.fixed_height.url) { (data, _, error) in
            if let error = error {
                print("There's an error with the url session broski. \(error) : \(error.localizedDescription)")
            }
            
            guard let data = data else {
                print("There was an error grabbing the data")
                completion(nil)
                return
            }
            
            let imageUrl = UIImage(data: data)
            completion(imageUrl)
            return
        }.resume()
    }
}
