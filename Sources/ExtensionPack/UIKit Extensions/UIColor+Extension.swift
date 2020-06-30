//
//  UIColor+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 02/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    @available(iOS 13, *)
    public convenience init(light lightColor: String, dark darkColor: UIColor) {
        self.init(light: UIColor(lightColor), dark: darkColor)
    }
    
    @available(iOS 13, *)
    public convenience init(light lightColor: UIColor, dark darkColor: String) {
        self.init(light: lightColor, dark: UIColor(darkColor))
    }
    
    @available(iOS 13, *)
    public convenience init(light lightColor: String, dark darkColor: String) {
        self.init(light: UIColor(lightColor), dark: UIColor(darkColor))
    }
    
    @available(iOS 13, *)
    public convenience init(light lightColor: UIColor, dark darkColor: UIColor) {
        self.init { traitCollection -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightColor : darkColor
        }
    }
    
    convenience init(_ hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = alpha
        
        let length = hexSanitized.count
        
        if Scanner(string: hexSanitized).scanHexInt64(&rgb) {
            if length == 6 {
                r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
                g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
                b = CGFloat(rgb & 0x0000FF) / 255.0
                
            } else if length == 8 {
                r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
                g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
                b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
                a = CGFloat(rgb & 0x000000FF) / 255.0   
            }
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    var hexString: String { toHexString() }
    
    internal func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return String(format:"#%06x", rgb)
    }

    func isLight(threshold: Float = 0.5) -> Bool? {
        let originalCGColor = self.cgColor
        let RGBCGColor = originalCGColor.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil)
        guard let components = RGBCGColor?.components else {
            return nil
        }
        guard components.count >= 3 else {
            return nil
        }
        
        let brightness = Float(((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000)
        return (brightness > threshold)
    }
    
    func withAlpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
}

extension UIColor {
    static func random() -> UIColor {
        let colors: [UIColor] = [
            .red,
            .green,
            .blue,
            .black,
            .gray,
            .darkGray,
            .darkText,
            .purple,
            .brown,
            .orange,
            .yellow,
            .cyan,
            .lightGray
        ]
        
        return colors.randomElement() ?? colors[0]
    }
}


