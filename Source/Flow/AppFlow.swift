//
//  AppFlow.swift
//
//
//  Created by baegteun on 2021/11/30.
//

import RxFlow
import RxRelay
import RxSwift

struct AppStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    private let disposeBag: DisposeBag = .init()
    
    func readyToEmitSteps() {
        Observable.just(FashionStep.loginIsRequired)
            .bind(to: steps)
            .disposed(by: disposeBag)
    }
}

final class AppFlow: Flow{
    
    // MARK: - Properties
    var root: Presentable{
        return self.rootWindow
    }
    
    private let rootWindow: UIWindow
    
    // MARK: - Init
    
    init(
        with window: UIWindow
    ){
        self.rootWindow = window
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asFashionStep else { return .none }
        
        switch step{
        case .loginIsRequired:
            return coordinateToLogin()
        case .mainIsRequired:
            return coordinateToMain()
        default:
            return .none
        }
    }
}

// MARK: - Method

private extension AppFlow{
    func coordinateToLogin() -> FlowContributors{
        let flow = LoginFlow(with: .init())
        Flows.use(flow, when: .created) { [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        let nextStep = OneStepper(withSingleStep: FashionStep.loginIsRequired)
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: nextStep))
    }
    func coordinateToMain() -> FlowContributors{
        let flow = MainFlow(with: .init())
        Flows.use(flow, when: .created) { [unowned self] root in
            self.rootWindow.rootViewController = root
        }
        let nextStep = OneStepper(withSingleStep: FashionStep.mainIsRequired)
        return .one(flowContributor: .contribute(withNextPresentable: flow, withNextStepper: nextStep))
    }
}

