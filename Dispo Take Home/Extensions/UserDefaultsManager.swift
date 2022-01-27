//
//  UserDefaultsManager.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/26/22.
//

import Foundation

extension UserDefaults {
    
    //Encode object into data
    static func encodeGifObject(object: GifObject, key: String) {
        do {

            let encoder = JSONEncoder()
            let data = try encoder.encode(object)
            UserDefaults.standard.set(data, forKey: key)
            
        } catch {
            print("Unable to Encode gif")
        }
    }
}
