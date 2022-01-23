import UIKit

/**
 All URL's and queries were tested using Postman to save time on my end
 */

struct GifAPIClient {
  // TODO: Implement
    static let shared = GifAPIClient()
    
    //MARK: - Trending
    func searchTrendingGifs(completion : @escaping ([GifObject]) -> Void) {
        
        // Example: https://api.giphy.com/v1/gifs/trending?api_key=1XyHwakiUAAS2h7kiIU3lQrIQcHk71a6&limit=25&rating=g
        
        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = Constants.giphyApiScheme
        urlComponent.host = Constants.giphyApiHost
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
    
    //MARK: - Search
    func searchTrendingGifs(searchTerm: String, completion : @escaping ([GifObject]) -> Void) {
        
        // Example: https://api.giphy.com/v1/gifs/search?api_key=1XyHwakiUAAS2h7kiIU3lQrIQcHk71a6&q=boxes&limit=50&offset=0&rating=g&lang=en
        
        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = Constants.giphyApiScheme
        urlComponent.host = Constants.giphyApiHost
        urlComponent.path = "/v1/gifs/search"
        print(urlComponent)
        
        guard let baseURL = urlComponent.url else { return }
        
        //query items
        let apiQuery = URLQueryItem(name: "api_key", value: Constants.giphyApiKey)
        let searchTermQuery = URLQueryItem(name: "q", value: "\(searchTerm)")
        let limitQuery = URLQueryItem(name: "limit", value: "50")
        let offsetQuery = URLQueryItem(name: "offset", value: "0")
        let ratingQuery = URLQueryItem(name: "rating", value: "pg")
        let languageQuery = URLQueryItem(name: "lang", value: "en")
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [apiQuery, searchTermQuery, limitQuery, offsetQuery, ratingQuery, languageQuery]
        
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
    
    //MARK: - Detailed Gif by ID
    func requestDetailedGif(gifID: String, completion : @escaping ([GifObject]) -> Void) {
        
        // Example: https://api.giphy.com/v1/gifs/kdpSpT0iQs0ZMttgV9?api_key=1XyHwakiUAAS2h7kiIU3lQrIQcHk71a6
        
        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = Constants.giphyApiScheme
        urlComponent.host = Constants.giphyApiHost
        urlComponent.path = "/v1/gifs/\(gifID)"
        print(urlComponent)
        
        guard let baseURL = urlComponent.url else { return }
        
        //query items
        let apiQuery = URLQueryItem(name: "api_key", value: Constants.giphyApiKey)
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [apiQuery]
        
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
