//
//  SearchButton.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit

final class SearchButton: UIButton{
    // MARK: - Properties
    private let inputLabel = UILabel().then {
        $0.text = "검색어를 입력하세요."
        $0.textColor = .init(red: 0, green: 0, blue: 0, alpha: 0.3)
        $0.textAlignment = .center
        $0.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 18)
    }
    
    private let magnifyingglassImageView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal))
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI

private extension SearchButton{
    func addView(){
        [inputLabel, magnifyingglassImageView].forEach{ addSubview($0) }
    }
    func setLayout(){
        inputLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        magnifyingglassImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(3)
            $0.centerY.equalToSuperview()
        }
    }
    func configureButton(){
        self.backgroundColor = FashionAsset.fashionMaincolor.color
        self.layer.cornerRadius = 10
    }
}
