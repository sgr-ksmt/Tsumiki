//
//  ComparableExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/24/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension Comparable {
    public func clamped(_ min: Self, _ max: Self) -> Self {
        return clamp(self, min, max)
    }
}
