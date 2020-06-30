//
//  File.swift
//  
//
//  Created by Federico Vitale on 30/06/2020.
//

import Foundation
import UIKit

final class BoxShadow {
    var spread: CGFloat
    var blur: CGFloat
    var offset: CGSize
    var opacity: Float
    var color: UIColor = UIColor.init(red: 100, green: 100, blue: 100, alpha: 0.25)
    
    static let standard: BoxShadow = .init(offset: .init(width: 2, height: 2), blur: 10, spread: -2, opacity: 0.15)
    static let light: BoxShadow = .init(offset: .init(width: 2, height: 2), blur: 8, spread: -2, opacity: 0.08)
    
    init(offset: CGSize, blur: CGFloat, spread: CGFloat, opacity: Float, color: UIColor? = nil) {
        self.offset = offset
        self.blur = blur
        self.spread = spread
        self.opacity = opacity
        
        if let color = color {
            self.color = color
        }
    }
}
