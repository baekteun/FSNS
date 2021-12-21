//
//  AuthLogoVIew.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit

final class AuthLogoView: UIView{
    // MARK: - Properties
    private let titleLabel = UILabel()
    
    init(title: String){
        super.init(frame: .zero)
        self.titleLabel.text = title
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutIfNeeded() {
        setGradient()
        addView()
        setLayout()
        configureView()
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
        
        self.titleLabel.font = UIFont(font: FashionFontFamily.Roboto.regular, size: 30)
        self.titleLabel.textColor = .white
    }
    func setGradient(){
        self.addGradient(with: [
            UIColor(red: 0.792, green: 0.588, blue: 0.949, alpha: 1).cgColor,
            UIColor(red: 0.655, green: 0.635, blue: 0.961, alpha: 1).cgColor,
            UIColor(red: 0.62, green: 0.824, blue: 0.937, alpha: 1).cgColor
        ], locations: [
            0, 0.49, 1
        ])
    }
}
