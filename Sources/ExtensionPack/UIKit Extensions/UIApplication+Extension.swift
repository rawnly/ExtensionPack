//
//  UIApplication+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 01/04/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 10, *)
extension UIApplication {
    @objc
    static func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString), url.canBeOpened {
            url.open(completion: nil)
        }
    }
}

