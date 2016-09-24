//
//  IntExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

public extension Int {
    public var positive: Bool {
        return self >= 0
    }
    public var negative: Bool {
        return !positive
    }
    public var even: Bool {
        return self % 2 == 0
    }
    public var odd: Bool {
        return !even
    }
}

public extension Int {
    public func times(_ body: (Int) -> Void) {
        (0..<Swift.max(0, self)).forEach(body)
    }
}

public extension UInt {
    public func times(_ body: (UInt) -> Void) {
        (0..<self).forEach(body)
    }
}
