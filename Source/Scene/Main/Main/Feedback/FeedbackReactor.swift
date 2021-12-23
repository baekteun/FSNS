import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class FeedbackReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactor
    enum Action{
    }
    enum Mutation{
    }
    struct State{
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension FeedbackReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - Reduce
extension FeedbackReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        return newState
    }
}


// MARK: - Method
private extension FeedbackReactor{
    
}
