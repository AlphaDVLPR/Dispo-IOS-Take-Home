//
//  FetchImage.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/24/22.
//

import UIKit

struct FetchImage {
    
    static let shared = FetchImage()
    
    //Fetch Image
    func fetchImage(result: GifObject, completion: @escaping (UIImage?) -> Void) {
        
        let baseUrl = result.images.fixed_height.url
        
        //Start the URL Session
        URLSession.shared.dataTask(with: baseUrl) { (data, _, error) in
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
