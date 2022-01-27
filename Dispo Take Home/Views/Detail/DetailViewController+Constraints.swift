//
//  DetailViewController+Constraints.swift
//  Dispo Take Home
//
//  Created by Jesse Cacanindin on 1/26/22.
//

import Foundation

extension DetailViewController {
    
    func setupViews() {
        view.clipsToBounds = true
        view.backgroundColor = .systemBackground
        
        view.addSubview(gifImageView)
        view.addSubview(titleDetailed)
        view.addSubview(sourceDetailed)
        view.addSubview(ratingDetailed)
        view.addSubview(urlDetailed)
        view.addSubview(idDetailed)
    }
    
    func setupLayouts() {
        
        // Layout constraints for `GifImageView`
        gifImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.height.equalTo(Constants.imageHeight * 2)
        }
        
        // Layout constraints for 'title
        titleDetailed.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(gifImageView.snp.bottom).offset(Constants.gifDescriptionVerticalPadding)
        }
        
        // Layout constraints for 'source'
        sourceDetailed.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(titleDetailed.snp.bottom).offset(Constants.gifDescriptionVerticalPadding)
        }
        
        // Layout constraints for 'rating'
        ratingDetailed.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(sourceDetailed.snp.bottom).offset(Constants.gifDescriptionVerticalPadding)
        }
        
        // Layout constraints for 'url'
        urlDetailed.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(ratingDetailed.snp.bottom).offset(Constants.gifDescriptionVerticalPadding)
        }
        
        // Layout constraints for 'id'
        idDetailed.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.trailing.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(urlDetailed.snp.bottom).offset(Constants.gifDescriptionVerticalPadding)
        }
    }
}
