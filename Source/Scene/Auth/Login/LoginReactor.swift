//
//  LoginReactor.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class LoginReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactor
    enum Action{
        case updateID(String?)
        case updatePassword(String?)
        case loginButtonDidTap
        case findPasswordButtonDidTap
    }
    enum Mutation{
        case setID(String?)
        case setPassword(String?)
    }
    struct State{
        var id: String?
        var password: String?
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension LoginReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case let .updateID(id):
            return .just(.setID(id))
        case let .updatePassword(pwd):
            return .just(.setPassword(pwd))
        case .loginButtonDidTap:
            steps.accept(FashionStep.mainIsRequired)
            return .empty()
        case .findPasswordButtonDidTap:
            steps.accept(FashionStep.findPasswordIsRequired)
            return .empty()
        }
    }
}

// MARK: - Reduce
extension LoginReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setID(id):
            newState.id = id
        case let .setPassword(pwd):
            newState.password = pwd
        }
        return newState
    }
}


// MARK: - Method
private extension LoginReactor{
    
}
