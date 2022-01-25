import UIKit
import CoreData

class MainViewController: UIViewController {
    
    //Source of truth
    var gifObjects: [GifObject] = []
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBar
        setupViews()
        setupLayouts()
        updateViews()
    }
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Gifs..."
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        collectionView.backgroundColor = .clear
        collectionView.keyboardDismissMode = .onDrag
        return collectionView
    }()
    
    private func setupViews() {
        view = UIView()
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GifCell.self, forCellWithReuseIdentifier: GifCell.identifier)
    }
    
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func updateViews() {
        GifAPIClient.shared.searchTrendingGifs { (gifObjects) in
            DispatchQueue.main.async {
                self.gifObjects = gifObjects
                self.collectionView.reloadData()
            }
        }
    }
}

// MARK: - UISearchBarDelegate

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text,
              !searchTerm.isEmpty else {return}
        
        GifAPIClient.shared.searchGifs(searchTerm: searchTerm) { (searched) in
            self.gifObjects = searched
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK: - CollectionView Datasource and Delegate
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifObjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GifCell.identifier, for: indexPath) as! GifCell
        let gifObject = gifObjects[indexPath.row]
        cell.setup(with: gifObject)
        cell.contentView.backgroundColor = .systemBackground
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gifID = gifObjects[indexPath.row].id
        GifAPIClient.shared.gifID = gifID
        let vc = DetailViewController()
        present(vc, animated: true, completion: nil)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = itemWidth(for: view.frame.width, spacing: LayoutConstant.spacing)
        
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutConstant.spacing, left: LayoutConstant.spacing, bottom: LayoutConstant.spacing, right: LayoutConstant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutConstant.spacing
    }
}

