//
//  GifCell.swift
//  Dispo Take Home
//
//  Created by Ashlyn Loveland on 1/23/22.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

//No other class needs to inherit from this class so I am using 'final'
final class GifCell: UICollectionViewCell {
    
    //MagicKeys
    private enum Constants {
        
        //ImageView layout constants
        static let imageHeight: CGFloat = 180.0
        
        //layout constants
        static let contentViewCornerRadius: CGFloat = 4.0
        static let verticalSpacing: CGFloat = 8.0
        static let horizontalPadding: CGFloat = 16.0
        static let gifDescriptionVerticalPadding: CGFloat = 8.0
    }
    
    private let gifImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = Constants.contentViewCornerRadius
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(gifImageView)
        contentView.addSubview(title)
    }
    
    private func setupLayouts() {
        gifImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        // Layout constraints for `GifImage`
        NSLayoutConstraint.activate([
            gifImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gifImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gifImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gifImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight)
        ])

        // Layout constraints for 'title'
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalPadding),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalPadding),
            title.topAnchor.constraint(equalTo: gifImageView.bottomAnchor, constant: Constants.gifDescriptionVerticalPadding)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with gif: GifObject) {
        
    }
}

extension GifCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
