//
//  CellRegisterable.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/19/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation
import UIKit

public protocol CellRegisterable: class {
    static var cellIdentifier: String { get }
}
