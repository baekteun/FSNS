//
//  MainVC.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

import Then
import RxCocoa
import SnapKit

final class MainVC: baseVC<MainReactor>{
    // MARK: - Properties
    private let profileImageView = UIBarButtonItem()
    
    
    // MARK: - UI
    override func addView() {
        [].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        
    }
    override func configureVC() {
        super.configureVC()
        self.navigationController?.configGradientBar(colors: [
            UIColor(red: 0.792, green: 0.588, blue: 0.949, alpha: 1).cgColor,
            UIColor(red: 0.655, green: 0.635, blue: 0.961, alpha: 1).cgColor,
            UIColor(red: 0.62, green: 0.824, blue: 0.937, alpha: 1).cgColor
        ], locations: [
            0, 0.54, 1
        ])
        self.navigationItem.configTitleView()
        self.navigationItem.configProfileButton()
        self.navigationItem.configureLogButton()
    }
    
    
    
    // MARK: - Reactor
    override func bindView(reactor: MainReactor) {
    }
}
