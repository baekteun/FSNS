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
import RxViewController
import RxSwift

final class MainVC: baseVC<MainReactor>{
    // MARK: - Properties
    private let profileImageView = UIBarButtonItem()
    
    private let mainPageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.85)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(MainPageCell.self, forCellWithReuseIdentifier: MainPageCell.reusableID)
        return collection
    }()
    
    
    
    // MARK: - UI
    override func addView() {
        [
            mainPageCollectionView
        ].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        mainPageCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(bound.width)
            $0.height.equalTo(bound.height*0.85)
        }
        
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
    override func bindAction(reactor: MainReactor) {
        self.rx.viewDidAppear
            .map { _ in  Reactor.Action.loadPost }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    override func bindState(reactor: MainReactor) {
        let sharedState = reactor.state.share(replay: 1).observe(on: MainScheduler.asyncInstance)
        
        sharedState
            .map { $0.post ?? [] }
            .bind(to: mainPageCollectionView.rx.items(cellIdentifier: MainPageCell.reusableID, cellType: MainPageCell.self)) { _, element ,cell in
                cell.model = element
            }
            .disposed(by: disposeBag)
        
    }
}
