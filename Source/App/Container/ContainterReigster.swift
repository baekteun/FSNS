//
//  ContainterReigster.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container{
    func registerDependencies(){
        registerVC()
        registerReactor()
    }
    
    func registerVC(){
        autoregister(LoginVC.self, initializer: LoginVC.init)
        autoregister(RegisterVC.self, initializer: RegisterVC.init)
        autoregister(FindPasswordVC.self, initializer: FindPasswordVC.init)
        autoregister(MainVC.self, initializer: MainVC.init)
    }
    func registerReactor(){
        autoregister(LoginReactor.self, initializer: LoginReactor.init)
        autoregister(RegisterReactor.self, initializer: RegisterReactor.init)
        autoregister(FindPasswordReactor.self, initializer: FindPasswordReactor.init)
        autoregister(MainReactor.self, initializer: MainReactor.init)
    }
}
