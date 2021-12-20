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
    
    func configGradientBar(
        colors: [CGColor],
        locations: [NSNumber],
        start: CGPoint = .init(x: 1.0, y: 0.0),
        end: CGPoint = .init(x: 0.0, y: 1.0)
    ){
        let gradient = CAGradientLayer()
        gradient.frame = navigationBar.bounds
        
        gradient.colors = colors
        gradient.startPoint = start
        gradient.endPoint = end
        gradient.locations = locations
        
        
        if let image = getImageFrom(gradientLayer: gradient) {
            if #available(iOS 15.0, *){
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundImage = image
                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
            }else{
                navigationBar.setBackgroundImage(image, for: .default)
            }
            
        }
    }
    
    private func getImageFrom(gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        
        return gradientImage
    }
}

extension UINavigationItem{
    func configureNavigationItem(){
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = FashionAsset.fashionMaincolor.color
        
        
        
    }
}

extension UINavigationBar{
    
    
}
