//
//  UINavigationControllerExt.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Kingfisher

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
    func configTitleView() -> Observable<Void> {
        let button = UIButton()
        button.setTitle("F", for: .normal)
        button.titleLabel?.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 30)
        self.titleView = button
        return button.rx.tap.asObservable()
    }
    func configProfileButton() -> Observable<Void>{
        let button = UIButton()
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.contentMode = .scaleAspectFit
        if let url = UserDefaults.standard.string(forKey: "PROFILE"),
           url.isEmpty == false{
            button.kf.setImage(with: URL(string: url) ?? .none,
                               for: .normal,
                               placeholder: nil,
                               options: [.cacheMemoryOnly])
        }else{
            button.setImage(FashionAsset.fashionDefaultProfile.image, for: .normal)
        }
        let item = UIBarButtonItem(customView: button)
        self.rightBarButtonItem = item
        return item.rx.tap.asObservable()
    }
    func configureLogButton() -> Observable<Void>{
        let button = UIButton()
        button.setTitle("Log out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        self.leftBarButtonItem = .init(customView: button)
        return button.rx.tap.asObservable()
    }
}

extension UINavigationBar{
}
