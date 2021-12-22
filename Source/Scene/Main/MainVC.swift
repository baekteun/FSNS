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
        self.navigationController?.configureNavigationColor()
        self.navigationItem.configTitleView()
        self.navigationItem.configProfileButton()
    }
    
    
    
    // MARK: - Reactor
    override func bindView(reactor: MainReactor) {
    }
}
