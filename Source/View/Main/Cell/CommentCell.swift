//
//  CommentCell.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/22.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import Cosmos
import Kingfisher

final class CommentCell: baseTableViewCell<Comment>{
    // MARK: - Properties
    private let profileImageView = UIImageView()
    
    private let usernameLabel = UILabel()
    
    private let starView = CosmosView()
    
    private let contentLabel = UILabel()
    
    // MARK: - UI
    override func addView() {
        [
            profileImageView,  usernameLabel, starView, contentLabel
        ].forEach{ addSubview($0) }
    }
    override func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(bound.width*0.0888)
        }
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(2)
        }
        starView.snp.makeConstraints {
            $0.top.equalTo(usernameLabel.snp.bottom)
            $0.leading.equalTo(usernameLabel.snp.leading)
        }
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).inset(4)
            $0.leading.equalTo(profileImageView.snp.leading)
        }
    }
    override func configureCell() {
        
    }
    
    override func bind(_ model: Comment) {
        profileImageView.kf.setImage(with: URL(string: model.profileImageUrl) ?? .none,
                                     placeholder: nil,
                                     options: [])
        usernameLabel.text = model.userName
        starView.rating = Double(model.starCount)
        contentLabel.text = model.content
    }
    
    
}
