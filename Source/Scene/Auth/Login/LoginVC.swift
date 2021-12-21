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
        $0.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 36)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let idTextField = LoginTextField(icon: UIImage(systemName: "person.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "ID")
    
    private let passwordTextField = LoginTextField(icon: UIImage(systemName: "lock.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal) ?? .init(), placeholder: "Password")
    
    private lazy var stack = UIStackView(arrangedSubviews: [idTextField, passwordTextField]).then {
        $0.axis = .vertical
        $0.spacing = bound.height*0.0112
    }
    
    private let findIdOrPasswordButton = UIButton().then {
        $0.setTitle("아이디 찾기/비밀번호 찾기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 11)
        $0.addUnderline()
    }
    
    private let loginButton = LoginExtButton(title: "로그인")
    
    private let toRegisterButton = LoginExtButton(title: "회원가입", backgroundColor: .init(red: 1.0, green: 0.6823, blue: 0.6823, alpha: 1))
    
    // MARK: - UI
    override func addView() {
        setGradient()
        [logoLabel, stack, findIdOrPasswordButton, toRegisterButton, loginButton].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        logoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(bound.height*0.2875)
            $0.centerX.equalToSuperview()
        }
        idTextField.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(35)
        }
        stack.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(bound.height*0.0484)
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.2301)
            $0.centerX.equalToSuperview()
        }
        findIdOrPasswordButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(5)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(11)
        }
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.388)
            $0.top.equalTo(stack.snp.bottom).offset(bound.height*0.0390)
        }
        toRegisterButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(loginButton)
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
    }
}

// MARK: - Method

private extension LoginVC{
    func setGradient(){
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(red: 0.792, green: 0.588, blue: 0.949, alpha: 1).cgColor,
            UIColor(red: 0.654, green: 0.635, blue: 0.96, alpha: 1).cgColor,
            UIColor(red: 0.619, green: 0.823, blue: 0.937, alpha: 1).cgColor
        ]
        layer.locations = [0, 0.48, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 1, c: -1, d: 0.32, tx: 0.5, ty: -0.16))
        layer.position = view.center
        self.view.layer.addSublayer(layer)
    }
}
