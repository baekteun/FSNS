//
//  Comment.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Differentiator

struct Comment{
    let userName: String
    let profileImageUrl: String
    let starCount: Int
    let content: String
}

extension Comment: IdentifiableType{
    var identity: String{
        return String(describing: self)
    }
}

extension Comment: Equatable{
    
}
