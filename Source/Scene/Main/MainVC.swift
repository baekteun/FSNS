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
    private let searchBarButton = SearchButton()
    
    private let tableView = UITableView().then {
        $0.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    }
    
    private let sideBarButton = UIBarButtonItem().then {
        $0.image = UIImage(systemName: "line.3.horizontal")?.withTintColor(.white, renderingMode: .alwaysOriginal)
    }
    
    private let profileImageView = UIBarButtonItem()
    
    private let dummyData = [
        FashionModel(fashionImage: FashionAsset.fashionDummyOne.image,
                     hanger: 4386,
                     isStarred: true,
                     isBookmarked: false,
                     saved: 62),
        FashionModel(fashionImage: FashionAsset.fashionDummyTwo.image,
                     hanger: 442,
                     isStarred: true,
                     isBookmarked: false,
                     saved: 28)
    ]
    
    // MARK: - UI
    override func addView() {
        [searchBarButton, tableView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        searchBarButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(bound.height*0.03)
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.1527)
            $0.height.equalTo(30)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBarButton.snp.bottom).offset(22)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    override func configureVC() {
        super.configureVC()
        self.navigationItem.leftBarButtonItem = sideBarButton
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
