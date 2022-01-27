import UIKit

class DetailViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        setupLayouts()
    }
    
    override func viewDidLoad() {

        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "gifDetailed") {
            do {
                let decoder = JSONDecoder()
                let gifDetailed = try decoder.decode(GifObject.self, from: data)
                
                setup(with: gifDetailed)
                titleDetailed.text = "TITLE: \(gifDetailed.title)"
                sourceDetailed.text = "SOURCE: \(gifDetailed.source_tld)"
                ratingDetailed.text = "RATING: \(gifDetailed.rating)"
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
    }
    
    let gifImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let titleDetailed: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let sourceDetailed: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let ratingDetailed: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
}
