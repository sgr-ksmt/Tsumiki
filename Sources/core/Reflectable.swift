//
//  Reflectable.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 10/7/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

protocol Reflectable {
}

extension Reflectable where Self: Any {
    private func toString(_ child: (String, Any)) -> String {
        return "\(child.0): \(child.1)"
    }
    
    private var list: [(String, Any)] {
        return Mirror(reflecting: self).children.flatMap { $0.label != nil ? ($0.label!, $0.value) : nil }
    }
    
    var reflected: String {
        return list.map(toString).joined(separator: "\n")
    }
    
    func reflected(includes: [String]) -> String {
        return list.filter { includes.contains($0.0) }.map(toString).joined(separator: "\n")
    }
    
    func reflected(excludes: [String]) -> String {
        return list.filter { !excludes.contains($0.0) }.map(toString).joined(separator: "\n")
    }
}
