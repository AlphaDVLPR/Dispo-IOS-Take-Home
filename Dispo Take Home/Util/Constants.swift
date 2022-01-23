enum Constants {}

extension Constants {
    // Get an API key from https://developers.giphy.com/dashboard/
    static let giphyApiKey = "1XyHwakiUAAS2h7kiIU3lQrIQcHk71a6"
    
    //URL Components
    static let giphyApiScheme = "https"
    static let giphyApiHost = "www.api.giphy.com"
    
    /**
     For the path make sure to add the last endpoint for what you are referring to in the Giphy API
     
        Example: "Constants.giphyApiPath"
     */
    static let giphyApiPath = "/v1/gifs/"
}
