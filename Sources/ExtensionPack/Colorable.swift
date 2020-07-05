//
//  Colorable.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 31/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public protocol Colorable {
    func toColor() -> UIColor
}

extension UIColor: Colorable {
    public func toColor() -> UIColor {
        return self
    }
}

extension String: Colorable {
    public func toColor() -> UIColor {
        return UIColor(self)
    }
}

#endif
