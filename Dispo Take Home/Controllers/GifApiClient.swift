import UIKit

/**
 All URL's and queries were tested using Postman to save time on my end
 */

struct GifAPIClient {
  // TODO: Implement
    static let shared = GifAPIClient()
    
    static func searchTrendingGifs(completion : @escaping ([GifObject]) -> Void) {
        
        // Example: https://api.giphy.com/v1/gifs/trending?api_key=1XyHwakiUAAS2h7kiIU3lQrIQcHk71a6&limit=25&rating=g
        
        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = "https"
        urlComponent.host = "www.api.giphy.com"
        urlComponent.path = "/v1/gifs/trending"
        print(urlComponent)
        
        guard let baseURL = urlComponent.url else { return }
        
        //query items
        let apiQuery = URLQueryItem(name: "api_key", value: Constants.giphyApiKey)
        let ratingQuery = URLQueryItem(name: "rating", value: "pg")
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [apiQuery, ratingQuery]
        
        //creating a request from the URL
        guard let urlRequest = urlComponents?.url else { completion([]) ; return }
        print(urlRequest)
        
        //data task
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in

            if let error = error {
                completion([]) ; print("\(error) : \(error.localizedDescription)") ;return
            }
            guard let data = data else { completion([]); return }

            //Decode
            do {
                let decoder = JSONDecoder()
                let topLevelDictionary = try decoder.decode(APIListResponse.self, from: data)
                completion(topLevelDictionary.data)
            } catch {
                print(error)
            }
        }.resume()
    }
}
