//
//  ViewControllerParameter.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/22/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

public protocol ViewControllerParameter {
    associatedtype Parameter = Any
    func setup(with parameter: Parameter?)
}

public extension ViewControllerParameter {
    func setup(with parameter: Parameter?) {}
}
