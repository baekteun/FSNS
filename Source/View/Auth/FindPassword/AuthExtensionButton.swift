//
//  AuthExtensionButton.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

final class AuthExtensionButton: UIButton{
    // MARK: - Properties
    
    // MARK: - Init
    init(title: String){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
private extension AuthExtensionButton{
    func configureButton(){
        self.layer.cornerRadius = 7
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
}
