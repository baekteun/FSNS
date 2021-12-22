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

final class MainPageCell: baseCollectionViewCell<MainPageModel>{
    // MARK: - Properties
    private let userProfileImageView = UIImageView()
    
    private let userNameLabel = UILabel()
    
    private let tagLabel = UILabel()
    
    private let postImageView = UIImageView()
    
    
    private let hangerButton = UIButton().then {
        $0.setImage(FashionAsset.fashionHanger.image, for: .normal)
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
    
    private let commentCountLabel = UILabel()
    
    private let commentTableView = UITableView().then {
        $0.register(CommentCell.self, forCellReuseIdentifier: CommentCell.reusableID)
    }
    
    private let moreButton = UIButton()
    
    // MARK: - UI
    override func addView() {
        iconStackView.addArrangeSubviews([hangerButton, starButton, commentButton])
        [
            userProfileImageView, userNameLabel, tagLabel, postImageView,
            iconStackView, lineView, bookMarkButton, evaluationCountLabel, hanggerdLabel,
            commentTableView, moreButton, commentCountLabel
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
        moreButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(14)
        }
        commentTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(hanggerdLabel.snp.bottom).offset(bound.height*0.0468)
            $0.bottom.equalTo(moreButton.snp.top)
        }
        commentCountLabel.snp.makeConstraints {
            $0.leading.equalTo(hanggerdLabel.snp.leading)
            $0.bottom.equalTo(commentTableView.snp.top)
        }
    }
    override func configureCell() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
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
        
        commentCountLabel.text = "평가 \(model.commentCount)개"
        
        Observable.just(model.comments)
            .bind(to: commentTableView.rx.items(cellIdentifier: CommentCell.reusableID, cellType: CommentCell.self)) { _, element, cell in
                cell.model = element
            }
            .disposed(by: disposeBag)
    }
    
}
