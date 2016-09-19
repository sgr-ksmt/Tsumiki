//
//  UICollectionViewCellExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

extension CellRegisterable where Self: UICollectionViewCell {
    public static var cellIdentifier: String {
        return self.className
    }
}

extension UICollectionViewCell: CellRegisterable {}
