//
//  UrlBuilder.swift
//  Dispo Take Home
//
//  Created by Ashlyn Loveland on 1/26/22.
//

import Foundation

struct UrlBuilder {
    
    //Build custom url components for url
    static func urlComponentBuilder(scheme: String, host: String, path: String) -> URL? {
        
        var urlComponent = URLComponents()
        
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path
        
        let baseURL = urlComponent.url
        
        return baseURL
    }
    
    //Build custom queries for url
    static func queriesBuilder(queries: [String: String]) -> [URLQueryItem] {
        var queryArray: [URLQueryItem] = []
        
        for (k, v) in queries {
            
            let query = URLQueryItem(name: k, value: v)
            queryArray.append(query)
        }
        return queryArray
    }
}
