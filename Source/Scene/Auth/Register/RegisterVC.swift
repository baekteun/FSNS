//
//  RegisterVC.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/20.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import PanModal
import SnapKit
import Then

final class RegisterVC: baseVC<RegisterReactor>, PanModalPresentable{
    // MARK: - Properties
    var panScrollable: UIScrollView?{
        return nil
    }
    var shortFormHeight: PanModalHeight{
        return .contentHeight(bound.height*0.6656)
    }
    var longFormHeight: PanModalHeight{
        return .contentHeight(bound.height*0.6656)
    }
    var cornerRadius: CGFloat{
        return 10
    }
    private let logoView = AuthLogoView(title: "회원가입")
    
    private let nameTextField = AuthExtensionTextField(icon: UIImage(systemName: "person")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "이름을 입력하세요.")
    
    private let emailTextField = AuthExtensionTextField(icon: UIImage(systemName: "envelope")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "E-mail을 입력하세요.")
    
    private let idTextField = AuthExtensionTextField(icon: UIImage(systemName: "person.text.rectangle")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "아이디을 입력하세요.")
    
    private let passwordTextField = AuthExtensionTextField(icon: UIImage(systemName: "lock.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "비밀번호를 입력하세요.")
    
    private let phoneTextField = AuthExtensionTextField(icon: UIImage(systemName: "phone.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "전화번호를 입력해주세요.")
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 30
    }
    
    private let registerButton = AuthExtensionButton(title: "회원가입 하기")
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoView.layoutIfNeeded()
    }
    
    // MARK: - UI
    override func addView() {
        stackView.addArrangeSubviews([nameTextField, emailTextField, idTextField, passwordTextField, phoneTextField])
        [
            logoView, stackView, registerButton
        ].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        logoView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(bound.height*0.1218)
        }
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.2222)
        }
        registerButton.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(bound.height*0.0484)
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.3055)
        }
    }
    override func configureVC() {
        
    }
}
