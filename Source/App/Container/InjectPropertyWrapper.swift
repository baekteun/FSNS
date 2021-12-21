//
//  InjectPropertyWrapper.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation

@propertyWrapper
class Inject<T> {
    
    let wrappedValue: T
    
    init() {
        self.wrappedValue = AppDelegate.container.resolve(T.self)!
    }
}

