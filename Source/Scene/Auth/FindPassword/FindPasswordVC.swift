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
    private let nameTextField = AuthExtensionTextField(icon: UIImage(systemName: "person.fill")?.withTintColor(.blue, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "이름을 입력하세요.")
    
    private let emailTextField = AuthExtensionTextField(icon: UIImage(systemName: "envelope")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "E-mail을 입력하세요.")
    
    private let findButton = AuthExtensionButton(title: "아이디/비밀번호 찾기")
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 30
    }
    
    // MARK: - Lifecycle
    override init() {
        super.init()
        stackView.addArrangeSubviews([nameTextField,emailTextField,findButton])
    }
    override init(reactor: FindPasswordReactor) {
        super.init(reactor: reactor)
        stackView.addArrangeSubviews([nameTextField,emailTextField,findButton])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .longForm)
    }
    
    // MARK: - UI
    override func addView() {
        [
            stackView
        ].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    override func configureVC() {
        
    }
}
