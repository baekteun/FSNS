//
//  StepExt.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/14.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

extension Step{
    var asFashionStep: FashionStep?{
        return self as? FashionStep
    }
}
