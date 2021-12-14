//
//  LoginFlow.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay

struct LoginStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return FashionStep.loginIsRequired
    }
}

final class LoginFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    
    let stepper: LoginStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    init(
        with stepper: LoginStepper
    ){
        self.stepper = stepper
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asFashionStep else { return .none }
        
        switch step{
        case .loginIsRequired:
            return coordinateToLogin()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension LoginFlow{
    func coordinateToLogin() -> FlowContributors{
        let reactor = LoginReactor()
        let vc = LoginVC(reactor: reactor)
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}
