//
//  DetailViewController+Constraints.swift
//  Dispo Take Home
//
//  Created by Ashlyn Loveland on 1/26/22.
//

import Foundation

extension DetailViewController {
    
    func setupViews() {
        view.clipsToBounds = true
        view.backgroundColor = .systemBackground
        
        view.addSubview(gifImageView)
    }
    
    func setupLayouts() {
        
        // Layout constraints for `GifImageView`
        gifImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Constants.imageHeight)
        }
    }
}
