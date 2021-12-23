//
//  FeedbackVC.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/23.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Cosmos
import RxSwift
import Then
import SnapKit

final class FeedbackVC: baseVC<FeedbackReactor>{
    // MARK: - Properties
    private let commentCountLabel = UILabel().then {
        $0.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 18)
    }
    
    private let commentTableView = UITableView().then {
        $0.register(CommentCell.self, forCellReuseIdentifier: CommentCell.reusableID)
    }
    
    private let starView = CosmosView()
    
    private let feedbackAddButton = UIButton().then {
        $0.setTitle("+피드백 추가하기", for: .normal)
        $0.setTitleColor(UIColor(hexString: "#ADADAD"), for: .normal)
        $0.titleLabel?.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 12)
    }
    
    // MARK: - Init
    init(comments: [Comment]){
        super.init()
        Observable<[Comment]>.just(comments)
            .map { Reactor.Action.`init`($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    override func addView() {
        [
            commentCountLabel, commentTableView, starView, feedbackAddButton
        ].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        commentCountLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(13)
        }
        starView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(7)
        }
        feedbackAddButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(bound.width*0.1317)
            $0.bottom.equalToSuperview().inset(7)
        }
        commentTableView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(bound.height*0.0796)
            $0.leading.trailing.equalToSuperview()
        }
    }
    override func configureVC() {
        
    }
}
