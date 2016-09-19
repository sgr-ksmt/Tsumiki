//
//  BundleExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension Bundle {
    public var appVersion: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    public var appBuildNumber: String {
        return object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
}
