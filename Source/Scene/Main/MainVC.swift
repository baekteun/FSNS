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
    private let sideBarButton = UIBarButtonItem().then {
        $0.image = UIImage(systemName: "line.3.horizontal")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    }
    
    private let profileImageView = UIBarButtonItem()
    
    
    // MARK: - UI
    override func addView() {
        [].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        
    }
    override func configureVC() {
        super.configureVC()
        self.navigationController?.configGradientBar(
            colors: [
                UIColor(red: 0.749, green: 0.733, blue: 0.961, alpha: 1).cgColor,
                UIColor(red: 0.58, green: 0.859, blue: 0.925, alpha: 1).cgColor
            ],
            locations: [1, 0])
    }
    
    
    
    // MARK: - Reactor
    override func bindView(reactor: MainReactor) {
        sideBarButton.rx.tap
            .map{ Reactor.Action.sideButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        profileImageView.rx.tap
            .map{ Reactor.Action.profileDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}
