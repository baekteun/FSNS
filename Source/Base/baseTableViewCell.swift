//
//  baseTableViewCell.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

class baseTableViewCell<T>: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
        configureCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addView(){}
    func setLayout(){}
    func configureCell(){}
    var model: T? {
        didSet { if let model = model { bind(model) } }
    }
    func bind(_ model: T){}
}
