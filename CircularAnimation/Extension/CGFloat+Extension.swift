//
//  CGFloat+Extension.swift
//  CircularAnimation
//
//  Created by jatin verma on 07/05/21.
//

import Foundation
import UIKit


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
