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

final class MainPageCell: baseCollectionViewCell<MainPageModel>{
    // MARK: - Properties
    private let userProfileImageView = UIImageView()
    
    private let userNameLabel = UILabel()
    
    private let tagLabel = UILabel()
    
    private let postImageView = UIImageView()
    
    
    private let hangerButton = UIButton()
    
    private let starButton = UIButton()
    
    private let commentButton = UIButton()
    
    private let iconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 11
    }
    
    
    private let lineView = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let bookMarkButton = UIButton()
    
    private let evaluationLabel = UILabel()
    
    // MARK: - UI
    override func addView() {
        iconStackView.addArrangeSubviews([hangerButton, starButton, commentButton])
        [
            userProfileImageView, userNameLabel, tagLabel, postImageView,
            iconStackView, lineView, bookMarkButton, evaluationLabel
        ].forEach{ addSubview($0) }
    }
    override func setLayout() {
        postImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(bound.height*0.0593)
            $0.centerX.equalToSuperview()
            $0.width.lessThanOrEqualTo(bound.width*0.8222)
            $0.height.lessThanOrEqualTo(bound.height*0.46875)
        }
        userProfileImageView.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.leading.equalTo(postImageView.snp.leading)
            $0.bottom.equalTo(postImageView.snp.top).inset(5)
        }
        userNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(userProfileImageView)
            $0.leading.equalTo(userProfileImageView.snp.trailing).offset(10)
        }
        tagLabel.snp.makeConstraints {
            $0.leading.equalTo(userNameLabel.snp.trailing).offset(2)
            $0.trailing.equalTo(postImageView.snp.trailing)
            $0.bottom.equalTo(postImageView.snp.top).inset(5)
        }
        iconStackView.snp.makeConstraints {
            $0.leading.equalTo(postImageView.snp.leading)
            $0.top.equalTo(postImageView.snp.bottom).offset(5)
        }
        lineView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.top.equalTo(iconStackView.snp.bottom).offset(20)
        }
    }
    override func configureCell() {
        
    }
    
    override func bind(_ model: MainPageModel) {
        
    }
    
}
