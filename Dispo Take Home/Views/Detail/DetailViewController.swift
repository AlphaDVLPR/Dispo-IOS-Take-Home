import UIKit

class DetailViewController: UIViewController {
    
    var gifDetailedObjects: [GifObject] = []
    
    //  init(searchResult: SearchResult) {
    //    super.init(nibName: nil, bundle: nil)
    //  }
    
    override func viewDidLoad() {
        
        setupViews()
    }
    
    private let gifImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private func setupViews() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }
    
    private func updateViews() {
        GifAPIClient.shared.requestDetailedGif(gifID: GifAPIClient.shared.gifID) { (gifObjects) in
            DispatchQueue.main.async {
                self.gifDetailedObjects = gifObjects
                
            }
        }
        
        if let loadedGif = UIImage.gifImageWithURL(gifDetailedObjects[0].images.fixed_height.url.absoluteString) {
            FetchImage.shared.fetchImage(result: gifDetailedObjects[0]) { (image) in
                DispatchQueue.main.async {
                    self.gifImageView.image = loadedGif
                }
            }
        }
        title.text = gif.title
    }

    //  required init?(coder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    //  }
}
