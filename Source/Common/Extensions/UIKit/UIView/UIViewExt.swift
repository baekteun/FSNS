//
//  UIViewExt.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

extension UIView{
    func addGradient(
        with colors: [CGColor],
        locations: [NSNumber],
        start: CGPoint = .init(x: 0.25, y: 0.5),
        end: CGPoint = .init(x: 0.75, y: 1)
    ){
        let gradient = CAGradientLayer()
        
        gradient.colors = colors
        gradient.startPoint = start
        gradient.endPoint = end
        gradient.locations = locations
        gradient.frame = self.frame
        layer.addSublayer(gradient)
    }
}
