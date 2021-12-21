//
//  LoginTextField.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/20.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit

final class LoginTextField: UITextField{
    // MARK: - Properties
    private let iconImageView = UIImageView()
    
    // MARK: - Init
    init(icon: UIImage, placeholder: String){
        super.init(frame: .zero)
        self.iconImageView.image = icon
        self.placeholder = placeholder
        addView()
        setLayout()
        configureTextField()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
private extension LoginTextField{
    func addView(){
        addSubview(iconImageView)
    }
    func setLayout(){
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(25)
        }
    }
    func configureTextField(){
        leftSapcing(width: 30, height: 25)
        addUnderline()
        self.font = UIFont(font: FashionFontFamily.Roboto.regular, size: 12)
        setPlaceholderColor(with: .white)
    }
}