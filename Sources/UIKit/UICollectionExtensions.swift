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
    public func cellForItem<C: UICollectionViewCell>(at indexPath: IndexPath) -> C? {
        return cellForItem(at: indexPath) as? C
    }
}
