//
//  UINavigationControllerExt.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit

extension UINavigationController{
    func configureNavigationController(){
        
    }
    
}

extension UINavigationItem{
    func configureNavigationItem(){
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = FashionAsset.fashionMaincolor.color
        
        standardAppearance = barAppearance
        scrollEdgeAppearance = barAppearance
        let iv = UILabel()
        iv.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 40)
        iv.text = "F"
        iv.textColor = .white
        titleView = iv
        
    }
}
