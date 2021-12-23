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
        case `init`([Comment])
    }
    enum Mutation{
        case setComment([Comment])
    }
    struct State{
        var comments: [Comment]?
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension FeedbackReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case let .`init`(com):
            return .just(.setComment(com))
        }
    }
}

// MARK: - Reduce
extension FeedbackReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setComment(com):
            newState.comments = com
        }
        return newState
    }
}


// MARK: - Method
private extension FeedbackReactor{
    
}
