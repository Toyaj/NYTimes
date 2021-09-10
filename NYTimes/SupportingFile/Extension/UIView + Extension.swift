//
//  UIView + Extension.swift
//  NYTimes
//
//  Created by Toyaj Nigam on 10/09/21.
//


import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
