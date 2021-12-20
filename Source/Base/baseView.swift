//
//  baseView.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

class baseView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        setLayout()
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addView(){}
    func setLayout(){}
    func configureView(){}
}
