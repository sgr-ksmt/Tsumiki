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
    public func cellForRow<C: UITableViewCell>(at indexPath: IndexPath) -> C? {
        return cellForRow(at: indexPath) as? C
    }
}
