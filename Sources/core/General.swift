//
//  General.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/24/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public func clamp<T: Comparable>(_ value: T, _ min: T, _ max: T) -> T {
    return Swift.min(Swift.max(min, value), max)
}
