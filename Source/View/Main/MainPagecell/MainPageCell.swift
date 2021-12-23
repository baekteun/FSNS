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
import MapKit

protocol MainPageCellDelegate: class{
    func userProfileButtonDidTap()
    func hangerButtonDidTap()
    func startButtonDidTap()
    func commentButtonDidTap()
    func bookmarkButtonDidTap()
}

final class MainPageCell: baseCollectionViewCell<MainPageModel>{
    // MARK: - Properties
    weak var delegate: MainPageCellDelegate?
    
    private let userProfileButton = UIButton().then {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    private let userNameLabel = UILabel().then {
        $0.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 10)
    }
    
    private let tagLabel = UILabel().then {
        $0.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 10)
    }
    
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
    
    private let descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 12)
    }
    
    
    // MARK: - UI
    override func addView() {
        iconStackView.addArrangeSubviews([hangerButton, starButton, commentButton])
        [
            userProfileButton, userNameLabel, tagLabel, postImageView,
            iconStackView, lineView, bookMarkButton, hanggerdLabel,
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
        userProfileButton.snp.makeConstraints {
            $0.width.height.equalTo(30)
            $0.leading.equalTo(postImageView.snp.leading)
            $0.bottom.equalTo(postImageView.snp.top)
        }
        userNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(userProfileButton)
            $0.leading.equalTo(userProfileButton.snp.trailing).offset(10)
        }
        iconStackView.snp.makeConstraints {
            $0.leading.equalTo(postImageView.snp.leading)
            $0.top.equalTo(postImageView.snp.bottom).offset(5)
        }
        hangerButton.snp.makeConstraints {
            $0.width.height.equalTo(starButton)
        }
        bookMarkButton.snp.makeConstraints{            $0.trailing.equalTo(postImageView.snp.trailing)
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
        bindView()
    }
    
    override func bind(_ model: MainPageModel) {
        postImageView.kf.setImage(with: URL(string: model.postImageUrl)!,
                                  placeholder: nil,
                                  options: [])
        
        userProfileButton.kf.setImage(
            with: URL(string: model.userProfileImageUrl)!,
            for: .normal,
            placeholder: nil,
            options: [])
        
        userNameLabel.text = model.userName
        
        let tags = model.tag.reduce(into: "") { partialResult, str in
             partialResult += "#\(str) "
        }
        tagLabel.text = tags
        
        hanggerdLabel.text = "옷걸이 \(model.hanggerdCount)개"
        
        descriptionLabel.text = model.description
        
    }
    
    private func bindView(){
        userProfileButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.userProfileButtonDidTap()
            })
            .disposed(by: disposeBag)
        
        hangerButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.hangerButtonDidTap()
            })
            .disposed(by: disposeBag)
        
        starButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.startButtonDidTap()
            })
            .disposed(by: disposeBag)
        
        commentButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.commentButtonDidTap()
            })
            .disposed(by: disposeBag)
        
        bookMarkButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.delegate?.bookmarkButtonDidTap()
            })
            .disposed(by: disposeBag)
    }
}

