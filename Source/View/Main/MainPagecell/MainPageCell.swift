//
//  MainPageCell.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Kingfisher
import RxSwift
import ReactorKit
import RxDataSources

final class MainPageCell: baseCollectionViewCell<MainPageModel>{
    // MARK: - Properties
    private let userProfileImageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private let userNameLabel = UILabel()
    
    private let tagLabel = UILabel()
    
    private let postImageView = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    
    private let hangerButton = UIButton().then {
        $0.setImage(FashionAsset.fashionHanger.image, for: .normal)
        $0.contentMode = .scaleAspectFit
    }
    
    private let starButton = UIButton().then {
        $0.setImage(UIImage(systemName: "star")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let commentButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bubble.left")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let iconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 11
    }
    
    
    private let lineView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let bookMarkButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bookmark")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let hanggerdLabel = UILabel()
    
    private let evaluationCountLabel = UILabel()
    
    private let descriptionLabel = UILabel()
    
    
    // MARK: - UI
    override func addView() {
        iconStackView.addArrangeSubviews([hangerButton, starButton, commentButton])
        [
            userProfileImageView, userNameLabel, tagLabel, postImageView,
            iconStackView, lineView, bookMarkButton, evaluationCountLabel, hanggerdLabel,
            descriptionLabel
        ].forEach{ addSubview($0) }
    }
    override func setLayout() {
        postImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(bound.height*0.0593)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(bound.width*0.8222)
            $0.height.equalTo(bound.height*0.46875)
        }
        userProfileImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.leading.equalTo(postImageView.snp.leading)
            $0.bottom.equalTo(postImageView.snp.top)
        }
        userNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(userProfileImageView)
            $0.leading.equalTo(userProfileImageView.snp.trailing).offset(10)
        }
        iconStackView.snp.makeConstraints {
            $0.leading.equalTo(postImageView.snp.leading)
            $0.top.equalTo(postImageView.snp.bottom).offset(5)
        }
        hangerButton.snp.makeConstraints {
            $0.width.height.equalTo(starButton)
        }
        bookMarkButton.snp.makeConstraints {
            $0.trailing.equalTo(postImageView.snp.trailing)
            $0.top.equalTo(postImageView.snp.bottom).offset(5)
        }
        lineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(iconStackView.snp.bottom).offset(20)
        }
        hanggerdLabel.snp.makeConstraints {
            $0.leading.equalTo(iconStackView.snp.leading)
            $0.top.equalTo(iconStackView.snp.bottom).offset(5)
        }
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(postImageView)
            $0.top.equalTo(hanggerdLabel.snp.bottom).offset(20)
            $0.bottom.equalToSuperview().inset(bound.height*0.1031)
        }
        tagLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(descriptionLabel)
            $0.bottom.equalToSuperview().inset(bound.height*0.0531)
        }
    }
    
    override func configureCell() {
        self.backgroundColor = .white
    }
    
    override func bind(_ model: MainPageModel) {
        postImageView.kf.setImage(with: URL(string: model.postImageUrl)!,
                                  placeholder: nil,
                                  options: [])
        
        userProfileImageView.kf.setImage(with: URL(string: model.userProfileImageUrl)!,
                                         placeholder: nil,
                                         options: [])
        
        userNameLabel.text = model.userName
        
        let tags = model.tag.reduce(into: "") { partialResult, str in
             partialResult += "#\(str) "
        }
        tagLabel.text = tags
        
        hanggerdLabel.text = "옷걸이 \(model.hanggerdCount)개"
        
        
        
        
    }
    
}

