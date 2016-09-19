//
//  ArrayExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension Collection {
    public subscript(safe index: Index) -> _Element? {
        return (startIndex..<endIndex) ~= index ? self[index] : nil
    }
    
    public func any(_ block: (Iterator.Element) -> Bool) -> Bool {
        for e in self {
            if block(e) {
                return true
            }
        }
        return false
    }

    public func none(_ block: (Iterator.Element) -> Bool) -> Bool {
        return filter(block).count == 0
    }
    
    public func all(_ block: (Iterator.Element) -> Bool) -> Bool {
        for e in self {
            if !block(e) {
                return false
            }
        }
        return true
    }
    
    public func one(_ block: (Iterator.Element) -> Bool) -> Bool {
        return filter(block).count == 1
    }
}

public extension Array where Element: Equatable {
    @discardableResult
    mutating public func remove(element: Element) -> Element? {
        return index(of: element).map { remove(at: $0) }
    }
    
    mutating public func remove(elements: [Element]) {
        elements.forEach { remove(element: $0) }
    }
    
    public func removed(element: Element) -> [Element] {
        var copied = self
        copied.remove(element: element)
        return copied
    }
    
    public func removed(elements: [Element]) -> [Element] {
        var copied = self
        copied.remove(elements: elements)
        return copied
    }
    
    public func uniqued() -> [Element] {
        var result: [Element] = []
        forEach {
            if !result.contains($0) {
                result.append($0)
            }
        }
        return result
    }
}

