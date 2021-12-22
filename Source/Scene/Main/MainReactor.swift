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
        case loadPost
    }
    enum Mutation{
        case setPost([MainPageModel])
    }
    struct State{
        var post: [MainPageModel]?
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate
extension MainReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action{
        case .loadPost:
            return loadPost()
        default:
            return .empty()
        }
    }
}

// MARK: - Reduce
extension MainReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setPost(model):
            newState.post = model
        }
        return newState
    }
}


// MARK: - Method
private extension MainReactor{
    func loadPost() -> Observable<Mutation>{
        let model = [
            MainPageModel(userProfileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png",
                                  userName: "baek", tag: ["멘투멘"], postImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", hanggerdCount: 20, commentCount: 2, comments: [
                                    Comment(userName: "baek", profileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", starCount: Int(arc4random_uniform(5)), content: "이런"),
                                    Comment(userName: "baek", profileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", starCount: Int(arc4random_uniform(5)), content: "이런")
                                  ]),
            MainPageModel(userProfileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png",
                                  userName: "baek", tag: ["멘투멘"], postImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", hanggerdCount: 20, commentCount: 2, comments: [
                                    Comment(userName: "baek", profileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", starCount: Int(arc4random_uniform(5)), content: "이런"),
                                    Comment(userName: "baek", profileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", starCount: Int(arc4random_uniform(5)), content: "이런")
                                  ]),
            MainPageModel(userProfileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png",
                                  userName: "baek", tag: ["멘투멘"], postImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", hanggerdCount: 20, commentCount: 2, comments: [
                                    Comment(userName: "baek", profileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", starCount: Int(arc4random_uniform(5)), content: "이런"),
                                    Comment(userName: "baek", profileImageUrl: "https://static.solved.ac/uploads/profile/360x360/baekteun-picture-1633655185573.png", starCount: Int(arc4random_uniform(5)), content: "이런")
                                  ])
            ]
        return .just(.setPost(model))
    }
}
