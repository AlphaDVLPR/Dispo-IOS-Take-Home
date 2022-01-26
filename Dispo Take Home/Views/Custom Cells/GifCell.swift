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
    
    let gifImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleToFill
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
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GifCell: ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
