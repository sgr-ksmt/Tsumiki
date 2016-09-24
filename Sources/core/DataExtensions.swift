//
//  DataExtensions.swift
//  Tsumiki
//
//  Created by Suguru Kishimoto on 9/24/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

extension Data {
    // ref: http://qiita.com/mono0926/items/3cf0dca3029f32f54a09
    var deviceTokenString: String {
        return self.map { String(format: "%02.2hhx", $0) }.joined()
    }
}
