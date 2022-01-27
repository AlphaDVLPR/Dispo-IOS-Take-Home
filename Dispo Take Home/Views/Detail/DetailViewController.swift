import UIKit

class DetailViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "gifDetailed") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let gifDetailed = try decoder.decode(GifObject.self, from: data)
                setup(with: gifDetailed)
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }
    
    override func viewDidLoad() {
        setupViews()
        setupLayouts()
    }
    
    let gifImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
//    let title: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
    
    //Wondering if it would be better to get the search result first
//    private func updateViews() {
//        GifAPIClient.requestDetailedGif(gifID: GifAPIClient.shared.gifID) { (gifObjects) in
//            DispatchQueue.main.async {
//                self.gifDetailedObjects = gifObjects
//                print(self.gifDetailedObjects)
//            }
//        }
//
//        if let loadedGif = UIImage.gifImageWithURL(gifDetailedObjects[0].images.fixed_height.url.absoluteString) {
//            FetchImage.fetchImage(result: gifDetailedObjects[0]) { (image) in
//                DispatchQueue.main.async {
//                    self.gifImageView.image = loadedGif
//                }
//            }
//        }
//    }
    
    //Cache the images using urlstring for the image that way you can tell if it's on the device already or do another network request
}
