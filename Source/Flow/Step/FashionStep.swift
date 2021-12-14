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
    
    // Auth
    case loginIsRequired
    
    // Main
    case mainIsRequired
}