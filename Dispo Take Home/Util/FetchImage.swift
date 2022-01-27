//
//  FetchImage.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/24/22.
//

import UIKit

struct FetchImage {
        
    //Fetch Image
    static func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
                
        //Start the URL Session
        URLSession.shared.dataTask(with: url) { (data, _, error) in
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
