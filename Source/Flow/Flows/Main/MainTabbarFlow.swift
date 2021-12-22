//
//  MainTabbarFlow.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/23.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import RxSwift
import RxFlow

final class MainTabbarFlow: Flow{
    // MARK: - Tabbar
    enum TabIndex: Int{
        case Closet = 0
        case Profile = 1
        case Search = 2
        case Main = 3
    }
    
    var root: Presentable{
        return self.rootVC
    }
    
    private let rootVC: UITabBarController = .init()
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    @Inject private var mainFlow: MainFlow
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asFashionStep else { return .none }
        
        switch step{
        case .mainTabbarIsRequired:
            return coordiateToMainTabbar()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MainTabbarFlow{
    func coordiateToMainTabbar() -> FlowContributors{
        Flows.use(
            mainFlow,
            when: .created
        ) { [unowned self] (root1: UINavigationController) in
            self.rootVC.setViewControllers([root1], animated: true)
            
        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: mainFlow, withNextStepper: mainFlow.stepper)
        ])
    }
}
