//
//  UITableViewExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/24/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    public enum Register {
        case `class`
        case nib
    }
    
    public func register<C: UITableViewCell>(_ type: Register, cellType: C.Type) where C: CellRegisterable {
        switch type {
        case .class:
            register(cellType, forCellReuseIdentifier: cellType.cellIdentifier)
        case .nib:
            let nib = UINib.init(nibName: cellType.className, bundle: nil)
            register(nib, forCellReuseIdentifier: cellType.className)
        }
    }
    
    public func register<V: UITableViewHeaderFooterView>(_ type: Register, viewType: V.Type) {
        switch type {
        case .class:
            register(viewType, forHeaderFooterViewReuseIdentifier: viewType.className)
        case .nib:
            let nib = UINib.init(nibName: viewType.className, bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: viewType.className)
        }
    }
    
    public func dequeue<C: UITableViewCell>(cellType: C.Type, for indexPath: IndexPath) -> C where C: CellRegisterable {
        return dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath) as! C
    }
    
    public func dequeue<V: UITableViewHeaderFooterView>(viewType: V.Type) -> V {
        return dequeueReusableHeaderFooterView(withIdentifier: viewType.className) as! V
    }
    
    public func cellForRow<C: UITableViewCell>(at indexPath: IndexPath) -> C? {
        return cellForRow(at: indexPath) as? C
    }
}
