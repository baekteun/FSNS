//
//  MainCell.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import Then

final class MainCell: baseTableViewCell<FashionModel>{
    // MARK: - Properties
    static let identifier = "maincell"
    
    private let fashionImageView = UIImageView()
    
    private let hangerButton = UIButton().then {
        $0.
    }
    
    private let starButton = UIButton()
    
    private let commentButton = UIButton()
    
    private lazy var stack = UIStackView(arrangedSubviews: [hangerButton, starButton, commentButton]).then {
        $0.axis = .horizontal
        $0.spacing = 5
    }
    
    private let bookmarkButton = UIButton()
    
    private let hangerredLabel = UILabel()
    
    private let savedLabel = UILabel()
    
    // MARK: - UI
    
    override func addView() {
        [fashionImageView, stack, bookmarkButton, hangerredLabel, savedLabel].forEach{ addSubview($0) }
    }
    override func setLayout() {
        fashionImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
        stack.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(fashionImageView.snp.bottom)
        }
        bookmarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(fashionImageView.snp.bottom)
        }
        hangerredLabel.snp.makeConstraints {
            $0.leading.equalTo(stack.snp.leading)
            $0.top.equalTo(stack.snp.bottom)
        }
        savedLabel.snp.makeConstraints {
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(bookmarkButton.snp.bottom)
        }
    }
    override func configureCell() {
        self.selectionStyle = .none
        
    }
    override func bind(_ model: FashionModel) {
        fashionImageView.image = model.fashionImage
        
        
    }
    
}


