//
//  DictionaryExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension Dictionary {
    public func union(other: Dictionary) -> Dictionary {
        var tmp = self
        other.forEach { tmp.updateValue($0.1, forKey: $0.0) }
        return tmp
    }
}
