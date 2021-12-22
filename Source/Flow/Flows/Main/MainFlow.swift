//
//  MainFlow.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay

struct MainStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return FashionStep.mainIsRequired
    }
}

final class MainFlow: Flow{
    // MARK: - Properties
    @Inject private var vc: MainVC
    
    var root: Presentable{
        return self.rootVC
    }
    
    @Inject var stepper: MainStepper
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
        case .mainIsRequired:
            return coordinateToMain()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MainFlow{
    func coordinateToMain() -> FlowContributors{
        self.rootVC.pushViewController(vc, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor))
    }
}
