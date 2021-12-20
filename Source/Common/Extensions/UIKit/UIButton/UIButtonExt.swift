//
//  UIButtonExt.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

extension UIButton{
    func addUnderline(){
        let view = UIView()
        view.backgroundColor = .white
        addSubview(view)
        view.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}
