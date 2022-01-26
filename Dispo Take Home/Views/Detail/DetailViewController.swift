import UIKit

class DetailViewController: UIViewController {
    
    var gifDetailedObjects: [GifObject] = []
    
    //  init(searchResult: SearchResult) {
    //    super.init(nibName: nil, bundle: nil)
    //  }
    
    override func viewDidLoad() {
        
        setupViews()
        setupLayouts()
        updateViews()
    }
    
    private let gifImageView: UIImageView = {
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
    
    private func setupViews() {
        view = UIView()
        view.backgroundColor = .systemBackground
    }
    
    private func setupLayouts() {
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
//        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout constraints for `GifImage`
        NSLayoutConstraint.activate([
            gifImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gifImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gifImageView.topAnchor.constraint(equalTo: view.topAnchor),
            gifImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])
        
        // Layout constraints for 'title'
//        NSLayoutConstraint.activate([
//            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.horizontalPadding),
//            title.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.horizontalPadding),
//            title.topAnchor.constraint(equalTo: gifImageView.bottomAnchor, constant: Constants.gifDescriptionVerticalPadding)
//        ])
    }
    
    private func updateViews() {
        GifAPIClient.shared.requestDetailedGif(gifID: GifAPIClient.shared.gifID) { (gifObjects) in
            DispatchQueue.main.async {
                self.gifDetailedObjects = gifObjects
                print(self.gifDetailedObjects)
            }
        }
        
        if let loadedGif = UIImage.gifImageWithURL(gifDetailedObjects[0].images.fixed_height.url.absoluteString) {
            FetchImage.shared.fetchImage(result: gifDetailedObjects[0]) { (image) in
                DispatchQueue.main.async {
                    self.gifImageView.image = loadedGif
                }
            }
        }
//        title.text = gifDetailedObjects[0].title
    }

    //  required init?(coder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    //  }
}
