//
//  Colorable.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 31/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

protocol Colorable {
    func toColor() -> UIColor
}

extension UIColor: Colorable {
    func toColor() -> UIColor {
        return self
    }
}

extension String: Colorable {
    func toColor() -> UIColor {
        return UIColor(self)
    }
}
