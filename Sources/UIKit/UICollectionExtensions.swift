//
//  UICollectionExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    public enum Register {
        case `class`
        case nib
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
    
    public func register<C: UICollectionViewCell>(_ type: Register, cellType: C.Type) where C: CellRegisterable {
        switch type {
        case .class:
            register(cellType, forCellWithReuseIdentifier: cellType.cellIdentifier)
        case .nib:
            let nib = UINib.init(nibName: cellType.className, bundle: nil)
            register(nib, forCellWithReuseIdentifier: cellType.cellIdentifier)
        }
    }
    
    public func register<V: UICollectionReusableView>(_ type: Register, viewType: V.Type, of kind: Kind) {
        switch type {
        case .class:
            register(viewType, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: viewType.className)
        case .nib:
            let nib = UINib.init(nibName: viewType.className, bundle: nil)
            register(nib, forSupplementaryViewOfKind: kind.value, withReuseIdentifier: viewType.className)
        }
    }
    
    public func dequeue<C: UICollectionViewCell>(cellType: C.Type, for indexPath: IndexPath) -> C where C: CellRegisterable {
        return dequeueReusableCell(withReuseIdentifier: cellType.cellIdentifier, for: indexPath) as! C
    }
    
    public func dequeue<V: UICollectionReusableView>(viewType: V.Type, of kind: Kind, for indexPath: IndexPath) -> V {
        return dequeueReusableSupplementaryView(ofKind: kind.value, withReuseIdentifier: viewType.className, for: indexPath) as! V
    }
    
    public func cellForItem<C: UICollectionViewCell>(at indexPath: IndexPath) -> C? {
        return cellForItem(at: indexPath) as? C
    }
}
