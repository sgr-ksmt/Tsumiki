//
//  Instantiatable.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/22/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

public protocol NibInstantiatable {
    static var nibName: String { get }
    static var bundle: Bundle? { get }
}

public extension NibInstantiatable where Self: UIView {
    public static var nibName: String {
        return self.className
    }
    
    public static var bundle: Bundle? {
        return nil
    }
    
    public static func instantiate() -> Self {
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError()
        }
        return view
    }
}

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String? { get }
    static var bundle: Bundle? { get }
}

public extension StoryboardInstantiatable where Self: UIViewController {
    public static var storyboardName: String {
        return self.className
    }
    
    public static var viewControllerIdentifier: String? {
        return nil
    }
    
    public static var bundle: Bundle? {
        return nil
    }
    
    public static func instantiate() -> Self {
        let loadViewController = { () -> UIViewController? in
            let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
            if let viewControllerIdentifier = viewControllerIdentifier {
                return storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
            } else {
                return storyboard.instantiateInitialViewController()
            }
        }
        
        guard let viewController = loadViewController() as? Self else {
            fatalError()
        }
        return viewController
    }
}

public extension StoryboardInstantiatable where Self: UIViewController, Self: ViewControllerParameter {
    public static func instantiate(with parameter: Parameter?) -> Self {
        let viewController = instantiate() as Self
        viewController.setup(with: parameter)
        return viewController
    }
}
