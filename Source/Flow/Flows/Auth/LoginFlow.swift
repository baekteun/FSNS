//
//  LoginFlow.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay
import PanModal

struct LoginStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return FashionStep.loginIsRequired
    }
}

final class LoginFlow: Flow{
    // MARK: - Properties
    @Inject private var vc: LoginVC
    
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject var stepper: LoginStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    init(){}
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asFashionStep else { return .none }
        switch step{
        case .loginIsRequired:
            return coordinateToLogin()
        case .mainIsRequired:
            return .end(forwardToParentFlowWithStep: FashionStep.mainTabbarIsRequired)
        case .findPasswordIsRequired:
            return navigateToFindPassword()
        case .registerIsRequired:
            return navigateToRegister()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension LoginFlow{
    func coordinateToLogin() -> FlowContributors{
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor))
    }
    func navigateToFindPassword() -> FlowContributors{
        let vc = FindPasswordVC()
        self.rootVC.presentPanModal(vc)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor))
    }
    func navigateToRegister() -> FlowContributors{
        let vc = RegisterVC()
        self.rootVC.presentPanModal(vc)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor))
    }
}
