//
//  UIScrollViewExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 1/3/17.
//  Copyright © 2017 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    public func scrollToTop(_ animated: Bool) {
        let offset = CGPoint(x: contentOffset.x, y: -contentInset.top)
        setContentOffset(offset, animated: animated)
    }
    
    public func scrollToBottom(_ animated: Bool) {
        let offset = CGPoint(x: contentOffset.x, y: max(-contentInset.top, contentSize.height - frame.height + contentInset.bottom))
        setContentOffset(offset, animated: animated)
    }

    public func scrollToLeft(_ animated: Bool) {
        let offset = CGPoint(x: -contentInset.left, y: contentOffset.y)
        setContentOffset(offset, animated: animated)
    }

    public func scrollToRight(_ animated: Bool) {
        let offset = CGPoint(x: max(-contentInset.left, contentSize.width - frame.width + contentInset.right), y: contentOffset.y)
        setContentOffset(offset, animated: animated)
    }
}
