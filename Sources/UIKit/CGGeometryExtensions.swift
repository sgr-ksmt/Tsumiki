//
//  CGGeometryExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public protocol CGFloatConvertible {
    var f: CGFloat { get }
}

extension Int: CGFloatConvertible {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension Float: CGFloatConvertible {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension Double: CGFloatConvertible {
    public var f: CGFloat {
        return CGFloat(self)
    }
}

extension CGFloat: CGFloatConvertible {
    public var f: CGFloat {
        return self
    }
}

public extension CGPoint {
    
    public init(size: CGSize) {
        self.init(x: size.width, y: size.height)
    }
    
    public init(_ x: CGFloatConvertible, _ y: CGFloatConvertible) {
        self.init(x: x.f, y: y.f)
    }

    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(lhs.x + rhs.x, lhs.y + rhs.y)
    }
    
    public static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(lhs.x - rhs.x, lhs.y - rhs.y)
    }
    
    public static func -= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs - rhs
    }
    
    public static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(lhs.x * rhs.x, lhs.y * rhs.y)
    }
    
    public static func *= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs * rhs
    }
    
    public static func * (point: CGPoint, scalar: CGFloatConvertible) -> CGPoint {
        return CGPoint(point.x * scalar.f, point.y * scalar.f)
    }
    
    public static func *= (point: inout CGPoint, scalar: CGFloatConvertible) {
        point = point * scalar
    }
    
    public static func / (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(lhs.x / rhs.x, lhs.y / rhs.y)
    }
    
    public static func /= (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs / rhs
    }
    
    public static func / (point: CGPoint, scalar: CGFloatConvertible) -> CGPoint {
        return CGPoint(point.x / scalar.f, point.y / scalar.f)
    }
    
    public static func /= (point: inout CGPoint, scalar: CGFloatConvertible) {
        point = point / scalar
    }
}


public extension CGSize {
    
    public init(_ length: CGFloatConvertible) {
        self.init(width: length.f, height: length.f)
    }
    
    public init(_ width: CGFloatConvertible, _ height: CGFloatConvertible) {
        self.init(width: width.f, height: height.f)
    }
    
    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(lhs.width + rhs.width, lhs.height + rhs.height)
    }
    
    public static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(lhs.width - rhs.width, lhs.height - rhs.height)
    }
    
    public static func -= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs - rhs
    }
    
    public static func * (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(lhs.width * rhs.width, lhs.height * rhs.height)
    }
    
    public static func *= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs * rhs
    }
    
    public static func * (size: CGSize, scalar: CGFloatConvertible) -> CGSize {
        return CGSize(size.width * scalar.f, size.height * scalar.f)
    }
    
    public static func *= (size: inout CGSize, scalar: CGFloatConvertible) {
        size = size * scalar
    }
    
    public static func / (lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(lhs.width / rhs.width, lhs.height / rhs.height)
    }
    
    public static func /= (lhs: inout CGSize, rhs: CGSize) {
        lhs = lhs / rhs
    }
    
    public static func / (size: CGSize, scalar: CGFloatConvertible) -> CGSize {
        return CGSize(size.width / scalar.f, size.height / scalar.f)
    }
    
    public static func /= (size: inout CGSize, scalar: CGFloatConvertible) {
        size = size / scalar
    }
    
    public var surfaceArea: CGFloat {
        return width * height
    }
}

public extension CGRect {
    public init(_ origin: CGPoint, _ size: CGSize) {
        self.init(origin: origin, size: size)
    }
    public init(_ x: CGFloatConvertible, _ y: CGFloatConvertible, _ width: CGFloatConvertible, _ height: CGFloatConvertible) {
        self.init(x: x.f, y: y.f, width: width.f, height: height.f)
    }
    
    public static func + (lhs: CGRect, rhs: CGRect) -> CGRect {
        return CGRect(lhs.origin + rhs.origin, lhs.size + rhs.size)
    }
    
    public static func += (lhs: inout CGRect, rhs: CGRect) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: CGRect, rhs: CGRect) -> CGRect {
        return CGRect(lhs.origin - rhs.origin, lhs.size - rhs.size)
    }
    
    public static func -= (lhs: inout CGRect, rhs: CGRect) {
        lhs = lhs - rhs
    }
    
    public static func union(rects: [CGRect]) -> CGRect {
        return rects.reduce(.null) { $0.union($1) }
    }

    public mutating func union(rects: [CGRect]) {
        self = rects.reduce(self) { $0.union($1) }
    }
}
