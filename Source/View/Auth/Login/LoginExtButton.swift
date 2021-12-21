//
//  LoginExtButton.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

final class LoginExtButton: UIButton{
    init(title: String, backgroundColor: UIColor = .white){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


private extension LoginExtButton{
    func configureButton(){
        self.setTitleColor(.black, for: .normal)
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont(font: FashionFontFamily.Roboto.regular, size: 15)
    }
}
