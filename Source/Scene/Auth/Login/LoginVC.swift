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
        $0.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 34)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "ID"
        $0.textAlignment = .center
        $0.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 18)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "PassWord"
        $0.textAlignment = .center
        $0.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 18)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    private lazy var stack = UIStackView(arrangedSubviews: [idTextField, passwordTextField]).then {
        $0.axis = .vertical
        $0.spacing = bound.height*0.0281
    }
    
    private let findIdOrPasswordButton = UIButton().then {
        $0.setTitle("아이디 찾기/비밀번호 찾기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 11)
        $0.addUnderline()
    }
    
    private let toRegisterButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 11)
        $0.addUnderline()
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont(font: FashionFontFamily.Supermercado.regular, size: 18)
        
    }
    
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
            $0.height.equalTo(bound.height*0.0548)
        }
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(bound.height*0.0548)
        }
        stack.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(bound.height*0.0484)
            $0.leading.trailing.equalToSuperview().inset(bound.width*0.2352)
            $0.centerX.equalToSuperview()
        }
        findIdOrPasswordButton.snp.makeConstraints {
            $0.leading.equalTo(stack.snp.leading)
            $0.top.equalTo(stack.snp.bottom)
        }
        toRegisterButton.snp.makeConstraints {
            $0.trailing.equalTo(stack.snp.trailing)
            $0.top.equalTo(stack.snp.bottom)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(stack.snp.bottom).offset(bound.height*0.0390)
            $0.height.equalTo(bound.height*0.0468)
            $0.width.equalTo(bound.width*0.2777)
        }
        
    }
    
    // MARK: - Reactor
    
    override func bindView(reactor: LoginReactor) {
        loginButton.rx.tap
            .map { _ in Reactor.Action.loginButtonDidTap }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
}

// MARK: - Method

private extension LoginVC{
    func setGradient(){
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(red: 0.749, green: 0.733, blue: 0.961, alpha: 1).cgColor,
            UIColor(red: 0.749, green: 0.733, blue: 0.961, alpha: 1).cgColor,
            UIColor(red: 0.58, green: 0.859, blue: 0.925, alpha: 1).cgColor
        ]
        layer.locations = [0, 0.44, 1]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 1, c: -1, d: 0.32, tx: 0.5, ty: -0.16))
        layer.position = view.center
        self.view.layer.addSublayer(layer)
    }
}
