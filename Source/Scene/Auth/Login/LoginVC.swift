//
//  LoginVC.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RxCocoa
import RxSwift

final class LoginVC: baseVC<LoginReactor>{
    // MARK: - Properties
    private let logoLabel = UILabel().then {
        $0.text = "Welcome\nto Fashion SNS"
        $0.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 36)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let idTextField = LoginTextField(icon: UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "ID")
    
    private let passwordTextField = LoginTextField(icon: UIImage(systemName: "lock.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "Password")
    
    private lazy var stack = UIStackView(arrangedSubviews: [idTextField, passwordTextField]).then {
        $0.axis = .vertical
        $0.spacing = bound.height*0.0112
    }
    
    private let findIdOrPasswordButton = UIButton().then {
        $0.setTitle("아이디/비밀번호 찾기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = UIFont(font: FashionFontFamily.Cafe24Ssurround.bold, size: 11)
        $0.addUnderline()
    }
    
    private let loginButton = LoginExtButton(title: "로그인",backgroundColor: .white)
    
    private let toRegisterButton = LoginExtButton(title: "회원가입", backgroundColor: .black, textColor: .white)
    
    private let buttonStack = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 5
    }
    
    // MARK: - UI
    override func addView() {
        buttonStack.addArrangeSubviews([loginButton, toRegisterButton])
        [logoLabel, stack, findIdOrPasswordButton, buttonStack].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(bound.height*0.1796)
            $0.centerX.equalToSuperview()
        }
        idTextField.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        stack.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(bound.height*0.1359)
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.1944)
            $0.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        toRegisterButton.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        buttonStack.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.1722)
            $0.bottom.equalToSuperview().inset(bound.height*0.15)
        }
        findIdOrPasswordButton.snp.makeConstraints {
            $0.top.equalTo(buttonStack.snp.bottom).offset(11)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Reactor
    
    override func bindView(reactor: LoginReactor) {
        loginButton.rx.tap
            .map { _ in Reactor.Action.loginButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        findIdOrPasswordButton.rx.tap
            .map { Reactor.Action.findPasswordButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        toRegisterButton.rx.tap
            .map { Reactor.Action.toRegisterButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

// MARK: - Method

private extension LoginVC{
    
}
