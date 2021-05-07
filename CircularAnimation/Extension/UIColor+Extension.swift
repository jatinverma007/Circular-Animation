//
//  UIColor+Extension.swift
//  CircularAnimation
//
//  Created by jatin verma on 07/05/21.
//

import Foundation
import UIKit


extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

