//
//  UIViewExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/24/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public extension UIView {
    public var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(CGPoint(newValue, y), size)
        }
    }
    
    public var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(CGPoint(x, newValue), size)
        }
    }
    
    public var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame = CGRect(origin, CGSize(newValue, height))
        }
    }
    
    public var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame = CGRect(origin, CGSize(width, newValue))
        }
    }
    
    public var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame = CGRect(newValue, size)
        }
    }
    
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame = CGRect(origin, newValue)
        }
    }
    
    public var top: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return y + height
        }
        set {
            y = newValue - height
        }
    }
    
    public var left: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return x + width
        }
        set {
            x = newValue - width
        }
    }
    
    @nonobjc public var center: CGPoint {
        get {
            return CGPoint(frame.midX, frame.midY)
        }
        set {
            self.frame = CGRect(
                CGPoint(
                    newValue.x - width / 2,
                    newValue.y - height / 2
                ),
                size
            )
        }
    }
    
    public var centerX: CGFloat {
        get {
            return frame.midX
        }
        set {
            self.center = CGPoint(newValue, centerY)
        }
    }
    
    public var centerY: CGFloat {
        get {
            return frame.midY
        }
        set {
            self.center = CGPoint(centerX, newValue)
        }
    }
}

public extension UIView {
    public func setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    public func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(radius, radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        layer.masksToBounds = true
    }
    
    public func setShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        guard let cornerRadius = cornerRadius else { return }
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}
