//
//  UIAlertAction+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 30/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertAction {
    convenience init(title: String) {
        self.init(title: title, style: .default)
    }
}

