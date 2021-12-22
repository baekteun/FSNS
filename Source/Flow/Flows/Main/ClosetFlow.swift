//
//  ClosetFlow.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/23.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay

struct ClosetStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return FashionStep.closetIsRequired
    }
}

final class ClosetFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    @Inject private var vc: ClosetVC
    @Inject var stepper: ClosetStepper
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
        case .closetIsRequired:
            return coordinateToCloset()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension ClosetFlow{
    func coordinateToCloset() -> FlowContributors{
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: vc.reactor))
    }
}
