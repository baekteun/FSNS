//
//  MainReactor.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class MainReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactor
    enum Action{
        case sideButtonDidTap
        case profileDidTap
    }
    enum Mutation{
    }
    struct State{
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension MainReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .sideButtonDidTap:
            // present sidebar
            return .empty()
        case .profileDidTap:
            // present profileVC
            return .empty()
        }
    }
}

// MARK: - Reduce
extension MainReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        return newState
    }
}


// MARK: - Method
private extension MainReactor{
    
}
