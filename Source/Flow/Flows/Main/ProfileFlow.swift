import RxFlow
import RxRelay

struct ProfileStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return FashionStep.profileIsRequired
    }
}

final class ProfileFlow: Flow{
    // MARK: - Properties
    var root: Presentable{
        return self.rootVC
    }
    @Inject var vc: ProfileVC
    @Inject var stepper: ProfileStepper
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
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension ProfileFlow{
    
}
