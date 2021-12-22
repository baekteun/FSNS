//
//  MainPageModel.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Differentiator


struct MainPageModel{
    let userProfileImageUrl: String
    let userName: String
    let tag: [String]
    let postImageUrl: String
    let hanggerdCount: Int
    let commentCount: Int
    let comments: [Comment]
}

extension MainPageModel: Equatable{
    static func == (lhs: MainPageModel, rhs: MainPageModel) -> Bool {
        return false
    }
}


