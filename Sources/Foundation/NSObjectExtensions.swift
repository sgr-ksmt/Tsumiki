//
//  NSObjectExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension NSObject {
    public static var className: String {
        return typename(self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}
