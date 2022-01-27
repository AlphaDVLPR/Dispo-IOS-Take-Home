import UIKit

struct GifAPIClient {
    
    // Using user defaults it is a system memory and it will disappear once it is terminated
    // using
    //MARK: - Trending
    static func searchTrendingGifs(completion : @escaping ([GifObject]) -> Void) {

        //URL
        guard let baseURL = UrlBuilder.urlComponentBuilder(scheme: GiphyMagicStrings.giphyApiScheme, host: GiphyMagicStrings.giphyApiHost, path: GiphyMagicStrings.giphyApiPathTrending) else { return }
                
        //Query Items
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = UrlBuilder.queriesBuilder(queries: ["\(GiphyMagicStrings.giphyApiKeyQuery)":"\(GiphyMagicStrings.giphyApiKey)", "limit":"24", "rating":"pg"])
        
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
    static func searchGifs(searchTerm: String, completion : @escaping ([GifObject]) -> Void) {
        
        //URL
        guard let baseURL = UrlBuilder.urlComponentBuilder(scheme: GiphyMagicStrings.giphyApiScheme, host: GiphyMagicStrings.giphyApiHost, path: GiphyMagicStrings.giphyApiPathSearch) else { return }
        
        //Query items
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = UrlBuilder.queriesBuilder(queries: ["\(GiphyMagicStrings.giphyApiKeyQuery)":"\(GiphyMagicStrings.giphyApiKey)", "q":"\(searchTerm)", "limit":"24", "offset":"0", "rating":"pg", "lang":"en"])
        
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
    static func requestDetailedGif(gifID: String, completion : @escaping ([GifObject]) -> Void) {

        //URL

        guard let baseURL = UrlBuilder.urlComponentBuilder(scheme: GiphyMagicStrings.giphyApiScheme, host: GiphyMagicStrings.giphyApiHost, path: "\(GiphyMagicStrings.giphyApiGlobalPath)\(gifID)") else { return }
        
        //query items
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = UrlBuilder.queriesBuilder(queries: ["\(GiphyMagicStrings.giphyApiKeyQuery)":"\(GiphyMagicStrings.giphyApiKey)"])
        
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
