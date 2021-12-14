//
//  NavigationBarView.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit

protocol sideButtonDelegate: class{
    func sideButtonDidTap()
}
protocol profileButtonDelegate: class{
    func profileButtonDidTap()
}

final class NavigationBarView: baseView{
    // MARK: - Properties
    weak var sideDelegate: sideButtonDelegate?
    
    weak var profileDelegate: profileButtonDelegate?
    
    private let logoLabel = UILabel().then {
        $0.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 40)
        $0.text = "F"
        $0.textColor = .white
    }
    
    private let sideButton = UIButton().then {
        $0.setImage(UIImage(systemName: "line.3.horizontal")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private let profileButton = UIButton()
    
    // MARK: - UI
    override func addView() {
        [logoLabel, sideButton, profileButton].forEach{ addSubview($0) }
    }
    override func setLayout() {
        logoLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        sideButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
        }
        profileButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(11)
            $0.centerY.equalToSuperview()
        }
    }
    override func configureView() {
        
    }
}
