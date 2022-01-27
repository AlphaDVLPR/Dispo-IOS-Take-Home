//
//  UserDefaultsManager.swift
//  Dispo Take Home
//
//  Created by Ashlyn Loveland on 1/26/22.
//

import Foundation

extension UserDefaults {
    
    static func encodeGifObject(object: GifObject, key: String) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(object)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: key)
            
        } catch {
            print("Unable to Encode gif")
        }
    }
}
