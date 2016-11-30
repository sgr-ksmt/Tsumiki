//
//  BoolExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 11/30/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension Bool {
    public init(_ x: Int) {
        self.init(x != 0)
    }
    
    public init?(_ x: String) {
        switch x {
        case "true":
            self.init(true)
        case "false":
            self.init(false)
        default:
            return nil
        }
    }
}
