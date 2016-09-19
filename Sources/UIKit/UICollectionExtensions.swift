//
//  UICollectionExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension UICollectionView {
    public enum Register {
        case `class`
        case nib
    }
    
    public func register<Cell: UICollectionViewCell>(_ type: Register = .class, cellType: Cell.Type) where Cell: CellRegisterable {
        switch type {
        case .class:
            register(cellType, forCellWithReuseIdentifier: cellType.cellIdentifier)
        case .nib:
            let nib = UINib.init(nibName: cellType.className, bundle: nil)
            register(nib, forCellWithReuseIdentifier: cellType.cellIdentifier)
        }
    }
    
    public enum Kind {
        case header
        case footer
        var value: String {
            switch self {
            case .header: return UICollectionElementKindSectionHeader
            case .footer: return UICollectionElementKindSectionFooter
            }
        }
    }
    
    public func register<View: UICollectionReusableView>(_ type: Register = .class, viewType: View.Type, of kind: Kind = .header) {
        switch type {
        case .class:
            register(viewType, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: viewType.className)
        case .nib:
            let nib = UINib.init(nibName: viewType.className, bundle: nil)
            register(nib, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: viewType.className)
        }
    }
    
    public func dequeue<Cell: UICollectionViewCell>(cellType: Cell.Type, for indexPath: IndexPath) -> Cell where Cell: CellRegisterable {
        return dequeueReusableCell(withReuseIdentifier: cellType.cellIdentifier, for: indexPath) as! Cell
    }
    
    public func dequeue<View: UICollectionReusableView>(viewType: View.Type, kind: Kind = .header, for indexPath: IndexPath) -> View {
        return dequeueReusableSupplementaryView(ofKind: kind.value, withReuseIdentifier: viewType.className, for: indexPath) as! View
    }
    
    public func cellForItem<Cell: UICollectionViewCell>(at indexPath: IndexPath) -> Cell? {
        return cellForItem(at: indexPath) as? Cell
    }
}
