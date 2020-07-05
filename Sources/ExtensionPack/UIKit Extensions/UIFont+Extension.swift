//
//  UIFont+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 03/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public enum Font : String {
    case none
}

public extension UIFont {    
    static func custom(_ font: Font, size: CGFloat = 17) -> UIFont? {
        return UIFont(name: font.rawValue, size: size)
    }
}

#endif
