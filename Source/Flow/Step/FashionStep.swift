//
//  FashionStep.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

enum FashionStep: Step{
    // Global
    case alert(title: String?, message: String?)
    case dismiss
    case sideButtonDidTap
    case profileButtonDidTap
    
    // Auth
    case loginIsRequired
    case loginIsCompleted
    case findPasswordIsRequired
    case registerIsRequired
    
    // Main
    case mainTabbarIsRequired
    case mainIsRequired
}
