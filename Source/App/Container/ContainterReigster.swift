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
        registerStepper()
        registerFlow()
    }
    
    func registerVC(){
        autoregister(LoginVC.self, initializer: LoginVC.init)
        autoregister(RegisterVC.self, initializer: RegisterVC.init)
        autoregister(FindPasswordVC.self, initializer: FindPasswordVC.init)
        autoregister(MainVC.self, initializer: MainVC.init)
        autoregister(ClosetVC.self, initializer: ClosetVC.init)
        autoregister(ProfileVC.self, initializer: ProfileVC.init)
        autoregister(SearchVC.self, initializer: SearchVC.init)
        autoregister(FeedbackVC.self, initializer: FeedbackVC.init)
    }
    func registerReactor(){
        // VC's
        autoregister(LoginReactor.self, initializer: LoginReactor.init)
        autoregister(RegisterReactor.self, initializer: RegisterReactor.init)
        autoregister(FindPasswordReactor.self, initializer: FindPasswordReactor.init)
        autoregister(MainReactor.self, initializer: MainReactor.init)
        autoregister(ClosetReactor.self, initializer: ClosetReactor.init)
        autoregister(ProfileReactor.self, initializer: ProfileReactor.init)
        autoregister(SearchReactor.self, initializer: SearchReactor.init)
        autoregister(FeedbackReactor.self, initializer: FeedbackReactor.init)
        
        // Cell's
    }
    
    func registerStepper(){
        autoregister(LoginStepper.self, initializer: LoginStepper.init)
        autoregister(MainStepper.self, initializer: MainStepper.init)
        autoregister(ClosetStepper.self, initializer: ClosetStepper.init)
    }
    
    func registerFlow(){
        autoregister(LoginFlow.self, initializer: LoginFlow.init)
        autoregister(MainFlow.self, initializer: MainFlow.init)
        autoregister(ClosetFlow.self, initializer: ClosetFlow.init)
    }
}
