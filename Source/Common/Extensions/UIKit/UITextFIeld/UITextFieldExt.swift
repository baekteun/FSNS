//
//  UITextFieldExt.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/20.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit

extension UITextField{
    func leftSapcing(width: CGFloat, height: CGFloat) {
        let spacer = UIView()
    
        spacer.widthAnchor.constraint(equalToConstant: width).isActive = true
        spacer.heightAnchor.constraint(equalToConstant: height).isActive = true
        leftView = spacer
        leftViewMode = .always
        
    }
    func addUnderline(with color: UIColor = .white){
        let line = UIView()
        line.backgroundColor = .white
        self.addSubview(line)
        line.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    func setPlaceholderColor(with color: UIColor){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [
                                                            NSAttributedString.Key.foregroundColor : color
                                                        ])
    }
}
