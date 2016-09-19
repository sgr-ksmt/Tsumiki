//
//  TypeName.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public func typename<T: Any>(_ type: T.Type) -> String {
    return String(describing: type)
}

public func fullTypename<T: Any>(_ type: T.Type) -> String {
    return String(reflecting: type)
}
