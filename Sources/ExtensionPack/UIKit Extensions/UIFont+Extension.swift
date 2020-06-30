//
//  UIFont+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 03/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

enum Font : String {
    // Circular Std
    case CircularStdBlack = "CircularStd-Black"
    case CircularStdBlackItalic = "CircularStd-BlackItalic"
    case CircularStdBold = "CircularStd-Bold"
    case CircularStdBoldItalic = "CircularStd-BoldItalic"
    case CircularStdMedium = "CircularStd-Medium"
    case CircularStdMediumItalic = "CircularStd-MediumItalic"
    case CircularStdBook = "CircularStd-Book"
    case CircularStdBookItalic = "CircularStd-BookItalic"
    
    // Avenir
    case AvenirMedium = "Avenir-Medium"
}

extension UIFont {
    static var header: UIFont = UIFont.custom(.CircularStdBold, size: 32) ?? .boldSystemFont(ofSize: 32)
    static var body: UIFont = UIFont.custom(.AvenirMedium, size: 18) ?? .systemFont(ofSize: 16, weight: .medium)
    
    static func custom(_ font: Font, size: CGFloat = 17) -> UIFont? {
        return UIFont(name: font.rawValue, size: size)
    }
}
