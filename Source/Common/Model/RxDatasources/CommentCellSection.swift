//
//  CommentCellSection.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/22.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxDataSources

struct CommentCellSection{
    let header: String
    var items: [Comment]
    init(header: String, items: [Comment]){
        self.header = header
        self.items = items
    }
}

extension CommentCellSection: AnimatableSectionModelType{
    typealias Item = Comment
    
    init(original: CommentCellSection, items: [Comment]) {
        self = original
        self.items = items
    }
    
    var identity: String{
        return header
    }
}
