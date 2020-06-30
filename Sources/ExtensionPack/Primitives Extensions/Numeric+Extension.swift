//
//  Numeric+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 01/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

extension Numeric {
    var safeString: String {
        return self as! Double >= 10.0 ? "\(self)" : "0\(self)"
    }
    
    var radiansValue: CGFloat {
        return (self as! CGFloat) * CGFloat.pi / 100
    }
    
    var orZero: Int {
        return (self as! Int) < 0 ? 0 : (self as! Int)
    }
    
    func or(_ opt: String) -> String {
        return (self as! Int) < 0 ? opt : "\(self)"
    }
}
