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
    
    public func register<Cell: UITableViewCell>(_ type: Register, cellType: Cell.Type) where Cell: CellRegisterable {
        switch type {
        case .class:
            register(cellType, forCellReuseIdentifier: cellType.cellIdentifier)
        case .nib:
            let nib = UINib.init(nibName: cellType.className, bundle: nil)
            register(nib, forCellReuseIdentifier: cellType.className)
        }
    }
    
    public func register<View: UITableViewHeaderFooterView>(_ type: Register, viewType: View.Type) {
        switch type {
        case .class:
            register(viewType, forHeaderFooterViewReuseIdentifier: viewType.className)
        case .nib:
            let nib = UINib.init(nibName: viewType.className, bundle: nil)
            register(nib, forHeaderFooterViewReuseIdentifier: viewType.className)
        }
    }
    
    public func dequeue<Cell: UITableViewCell>(cellType: Cell.Type, for indexPath: IndexPath) -> Cell where Cell: CellRegisterable {
        return dequeueReusableCell(withIdentifier: cellType.cellIdentifier, for: indexPath) as! Cell
    }
    
    public func dequeue<View: UITableViewHeaderFooterView>(viewType: View.Type) -> View {
        return dequeueReusableHeaderFooterView(withIdentifier: viewType.className) as! View
    }
    
    public func cellForRow<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell? {
        return cellForRow(at: indexPath) as? Cell
    }
}
