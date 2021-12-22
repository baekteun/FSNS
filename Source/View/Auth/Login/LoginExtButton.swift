//
//  LoginExtButton.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

final class LoginExtButton: UIButton{
    init(title: String, backgroundColor: UIColor = .white, textColor: UIColor = .black){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = backgroundColor
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension LoginExtButton{
    func configureButton(){
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.titleLabel?.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 14)
    }
}
