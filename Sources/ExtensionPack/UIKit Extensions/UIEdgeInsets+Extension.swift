//
//  UIEdgeInsets+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 26/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public extension UIEdgeInsets {
    init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: value, right: value)
    }
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    static func All(_ value: CGFloat) -> Self {
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value);
    }
    
    static func Symmetric(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> Self {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal);
    }
    
    static func Only(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> Self {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right);
    }
}

#endif
