//
//  CellReusableID.swift
//  Fashion
//
//  Created by 최형우 on 2021/12/21.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

protocol ReuseIdentifiable{
    static var reusableID: String { get }
}
extension ReuseIdentifiable{
    static var reusableID: String{
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifiable {}
extension UICollectionViewCell: ReuseIdentifiable {}





