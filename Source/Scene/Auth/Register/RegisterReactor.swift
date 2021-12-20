//
//  RegisterReactor.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/20.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class RegisterReactor: Reactor, Stepper{
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
extension RegisterReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
}

// MARK: - Reduce
extension RegisterReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
            
        }
        return newState
    }
}


// MARK: - Method
private extension RegisterReactor{
    
}
