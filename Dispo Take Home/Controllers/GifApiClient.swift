import UIKit

/**
 All URL's and queries were tested using Postman to save time on my end
 */

struct GifAPIClient {
    
    static var shared = GifAPIClient()
    var gifID: String = ""
    
    //MARK: - Trending
    func searchTrendingGifs(completion : @escaping ([GifObject]) -> Void) {

        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = GiphyMagicStrings.giphyApiScheme
        urlComponent.host = GiphyMagicStrings.giphyApiHost
        urlComponent.path = GiphyMagicStrings.giphyApiPathTrending
        
        guard let baseURL = urlComponent.url else { return }
                
        //query items
        let apiQuery = URLQueryItem(name: GiphyMagicStrings.giphyApiKeyQuery, value: GiphyMagicStrings.giphyApiKey)
        let limitQuery = URLQueryItem(name: "limit", value: "14")
        let ratingQuery = URLQueryItem(name: "rating", value: "pg")
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [apiQuery, limitQuery, ratingQuery]
        
        //creating a request from the URL
        guard let urlRequest = urlComponents?.url else { completion([]) ; return }
        
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
    func searchGifs(searchTerm: String, completion : @escaping ([GifObject]) -> Void) {
        
        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = GiphyMagicStrings.giphyApiScheme
        urlComponent.host = GiphyMagicStrings.giphyApiHost
        urlComponent.path = GiphyMagicStrings.giphyApiPathSearch
        
        guard let baseURL = urlComponent.url else { return }
        
        //query items
        let apiQuery = URLQueryItem(name: GiphyMagicStrings.giphyApiKeyQuery, value: GiphyMagicStrings.giphyApiKey)
        let searchTermQuery = URLQueryItem(name: "q", value: "\(searchTerm)")
        let limitQuery = URLQueryItem(name: "limit", value: "14")
        let offsetQuery = URLQueryItem(name: "offset", value: "0")
        let ratingQuery = URLQueryItem(name: "rating", value: "pg")
        let languageQuery = URLQueryItem(name: "lang", value: "en")
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [apiQuery, searchTermQuery, limitQuery, offsetQuery, ratingQuery, languageQuery]
        
        //creating a request from the URL
        guard let urlRequest = urlComponents?.url else { completion([]) ; return }
                
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

        //URL
        var urlComponent = URLComponents()
        
        urlComponent.scheme = GiphyMagicStrings.giphyApiScheme
        urlComponent.host = GiphyMagicStrings.giphyApiHost
        urlComponent.path = "\(GiphyMagicStrings.giphyApiGlobalPath)\(gifID)"
        
        guard let baseURL = urlComponent.url else { return }
        
        //query items
        let apiQuery = URLQueryItem(name: GiphyMagicStrings.giphyApiKeyQuery, value: GiphyMagicStrings.giphyApiKey)
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [apiQuery]
        
        //creating a request from the URL
        guard let urlRequest = urlComponents?.url else { completion([]) ; return }
        
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
