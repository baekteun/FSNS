//
//  FindPasswordVC.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/20.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import PanModal
import SnapKit

final class FindPasswordVC: baseVC<FindPasswordReactor>, PanModalPresentable{
    // MARK: - Properties
    var panScrollable: UIScrollView?{
        return nil
    }
    var shortFormHeight: PanModalHeight{
        return .contentHeight(bound.height*0.4203)
    }
    var longFormHeight: PanModalHeight{
        return .contentHeight(bound.height*0.4203)
    }
    var cornerRadius: CGFloat{
        return 10
    }
    private let logoView = AuthLogoView(title: "아이디/비번찾기")
    
    private let nameTextField = AuthExtensionTextField(icon: UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "이름을 입력하세요.")
    
    private let emailTextField = AuthExtensionTextField(icon: UIImage(systemName: "envelope")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "E-mail을 입력하세요.")
    
    private let findButton = AuthExtensionButton(title: "아이디/비밀번호 찾기")
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 30
    }
    
    // MARK: - Lifecycle
    override init() {
        super.init()
        stackView.addArrangeSubviews([nameTextField,emailTextField])
    }
    override init(reactor: FindPasswordReactor) {
        super.init(reactor: reactor)
        stackView.addArrangeSubviews([nameTextField,emailTextField])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .longForm)
    }
    
    override func viewDidLayoutSubviews() {
        logoView.layoutIfNeeded()
    }
    
    // MARK: - UI
    override func addView() {
        [
            logoView, stackView, findButton
        ].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        logoView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(bound.height*0.1218)
        }
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.222)
        }
        findButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(bound.height*0.0484)
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.3055)
        }
    }
    override func configureVC() {
        
    }
}
