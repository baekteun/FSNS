//
//  AuthLogoVIew.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import Then

final class AuthLogoView: UIView{
    // MARK: - Properties
    private let titleLabel = UILabel().then {
        $0.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 30)
        $0.textColor = .white
        
    }
    
    init(title: String){
        super.init(frame: .zero)
        self.titleLabel.text = title
        addView()
        setLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
private extension AuthLogoView{
    func addView(){
        addSubview(titleLabel)
    }
    func setLayout(){
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    func configureView(){
        self.backgroundColor = .black
    }
}
