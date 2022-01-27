//
//  GifCell+Constraints.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/25/22.
//

import UIKit

extension GifCell {
    
    func setupViews() {
        contentView.clipsToBounds = true
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubview(gifImageView)
        contentView.addSubview(title)
    }
    
    func setupLayouts() {
        
        // Layout constraints for `GifImageView`
        gifImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(Constants.imageHeight)
        }
        
        // Layout constrains for 'title'
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(gifImageView.snp.bottom).offset(Constants.gifDescriptionVerticalPadding)
        }
    }
}
