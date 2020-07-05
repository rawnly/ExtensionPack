//
//  UILabel+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 03/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public extension UILabel {
    convenience init(_ text: String?, font: UIFont = .systemFont(ofSize: 18), ofColor color: UIColor = .black) {
        self.init(frame: .zero)
        
        self.text = text
        self.font = font
        self.textColor = color
    }
}

#endif
