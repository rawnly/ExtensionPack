//
//  UIView+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 01/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Convenience initializers
extension UIView {
    convenience init(color: UIColor) {
        self.init()
        
        setBackgroundColor(color)
    }
}

// MARK: - Style
extension UIView {
    typealias BorderPosition = Side
    
    enum Axis {
        case horizontal
        case vertical
        
        @available(*, deprecated, renamed: "horizontal")
        case x
        
        @available(*, deprecated, renamed: "vertical")
        case y
    }
        
    @discardableResult
    func setBackgroundColor(_ to: UIColor) -> Self {
        backgroundColor = to
        return self
    }
    
    @discardableResult
    func setBorder(_ position: BorderPosition, height: CGFloat, color: UIColor) -> Self {
        let borderView = UIView()
        
        
        borderView
            .addToView(self)
            .setBackgroundColor(color)
        
        
        if position == .top {
            borderView
                .setConstraints([
                    borderView.heightAnchor.constraint(equalToConstant: height),
                    borderView.topAnchor.constraint(equalTo: topAnchor),
                    borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                ])
        }
        
        if position == .right {
            borderView
                .setConstraints([
                    borderView.heightAnchor.constraint(equalToConstant: height),
                    borderView.topAnchor.constraint(equalTo: topAnchor),
                    borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                    borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                ])
        }
        
        if position == .bottom {
            borderView
                .setConstraints([
                    borderView.heightAnchor.constraint(equalToConstant: height),
                    borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                    borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                ])
        }
        
        if position == .left {
            borderView
                .setConstraints([
                    borderView.heightAnchor.constraint(equalToConstant: height),
                    borderView.topAnchor.constraint(equalTo: topAnchor),
                    borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                    borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                ])
        }
        
        
        return self
    }
    
    @discardableResult
    func setBorders(height: CGFloat, color: UIColor, _ positions: BorderPosition...) -> Self {
        positions.forEach { setBorder($0, height: height, color: color) }
        return self
    }
    
    func addParallaxEffect(x: Int = 20, y: Int = 20) {
        let horizontal = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -x
        horizontal.maximumRelativeValue = x
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -y
        vertical.maximumRelativeValue = y
        
        let motionEffectsGroup = UIMotionEffectGroup()
        motionEffectsGroup.motionEffects = [horizontal, vertical]
        
        addMotionEffect(motionEffectsGroup)
    }
    
    
    func hide() {
        alpha = 0
        isUserInteractionEnabled = false
    }
    
    func show() {
        alpha = 1
        isUserInteractionEnabled = true
    }
}


// MARK: - Constraints
extension UIView {
    @discardableResult
    func setConstraints(_ constraints: [NSLayoutConstraint]) -> UIView {
        guard let _ = superview else {
            return self
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
        return self
    }
    

    // Utility functions
    
    /// Convert a Side to a NSLayoutYAxisAncor
    internal func getYAnchor(_ side: Side, of view: UIView) -> NSLayoutAnchor<NSLayoutYAxisAnchor>? {
        switch side {
        case .top:
            return view.topAnchor;
        case .bottom:
            return view.bottomAnchor;
        default:
            return nil
        }
    }
    
    /// Convert a Side to a NSLayoutXAxisAncor
    internal func getXAnchor(_ side: Side, of view: UIView) -> NSLayoutAnchor<NSLayoutXAxisAnchor>? {
        switch side {
        case .left:
            return view.leadingAnchor;
        case .right:
            return view.trailingAnchor;
        default:
            return nil
        }
    }
    
    
    /// Anchor sides to view
    @discardableResult
    func anchor(_ sides: [Side], to targetSides: [Side], of sv: UIView, withMargin margin: CGFloat = 0) -> UIView {
        var constraints: [NSLayoutConstraint] = []
                        
        for (idx, side) in sides.enumerated() {
            let targetSide = targetSides[idx]
            
            switch side {
            case .top:
                constraints.append(topAnchor.constraint(equalTo: getYAnchor(targetSide, of: sv) ?? sv.topAnchor, constant: margin))
                break
            case .bottom:
                constraints.append(bottomAnchor.constraint(equalTo: getYAnchor(targetSide, of: sv) ?? sv.bottomAnchor, constant: -margin))
                break
            case .left:
                constraints.append(leadingAnchor.constraint(equalTo: getXAnchor(targetSide, of: sv) ?? sv.leadingAnchor, constant: margin))
                break
            case .right:
                constraints.append(trailingAnchor.constraint(equalTo: getXAnchor(targetSide, of: sv) ?? sv.trailingAnchor, constant: -margin))
                break
            }
        }
        
        return setConstraints(constraints)
    }
    
    /// Anchor sides to layoutGuide
    @discardableResult
    func anchor(_ sides: [Side], to targetSides: [Side], of sv: UILayoutGuide, withMargin margin: CGFloat = 0) -> UIView {
        var constraints: [NSLayoutConstraint] = []
                        
        for side in sides {           
            switch side {
            case .top:
                constraints.append(topAnchor.constraint(equalTo: sv.topAnchor, constant: margin))
                break
            case .bottom:
                constraints.append(bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: -margin))
                break
            case .left:
                constraints.append(leadingAnchor.constraint(equalTo: sv.leadingAnchor, constant: margin))
                break
            case .right:
                constraints.append(trailingAnchor.constraint(equalTo: sv.trailingAnchor, constant: -margin))
                break
            }
        }
        
        return setConstraints(constraints)
    }
    
    
    /// Anchor to sides of superview
    @discardableResult
    func anchor(to sides: [Side], margin: CGFloat = 0) -> UIView {
        guard let sv = superview else {
            return self
        }

        var constraints: [NSLayoutConstraint] = []
                        
        for side in sides {
            switch side {
            case .top:
                constraints.append(topAnchor.constraint(equalTo: sv.topAnchor, constant: margin))
                break
            case .bottom:
                constraints.append(bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: -margin))
                break
            case .left:
                constraints.append(leadingAnchor.constraint(equalTo: sv.leadingAnchor, constant: margin))
                break
            case .right:
                constraints.append(trailingAnchor.constraint(equalTo: sv.trailingAnchor, constant: -margin))
                break
            }
        }
        
        return setConstraints(constraints)
    }
    
    /// Easily set and activate constraints
    @discardableResult
    func setConstraints(_ constraints: NSLayoutConstraint...) -> UIView {
        guard let _ = superview else {
            return self
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
        return self
    }
    
    /// Center the view into the superview
    @discardableResult
    func centerInSuperView(_ x: CGFloat = 0, _ y: CGFloat = 0) -> UIView {
        guard let superView = superview else { return self }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        return setConstraints([
            centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: x),
            centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: y)
        ])
    }
   
    @discardableResult
    func centerInSuperView(axis: Axis, constant: CGFloat = 0) -> UIView {
        guard let superView = superview else { return self }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if axis == .horizontal {
            return setConstraints([
                centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: constant)
            ])
        }
        
        return setConstraints([
            centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: constant)
        ])
    }
   
    
     /// Fill super view
     @discardableResult
     func fillSuperView(axis: Axis, constant: CGFloat = 0) -> UIView {
         guard let superView = superview else { return self }
         translatesAutoresizingMaskIntoConstraints = false
         
         switch axis {
         case .horizontal, .x:
             return setConstraints([
                 trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -constant),
                 leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant),
             ])
         case .y, .vertical:
             return setConstraints([
                 topAnchor.constraint(equalTo: superView.topAnchor, constant: constant),
                 bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -constant)
             ])
         }
     }
    
    @discardableResult
    func setSize(w: CGFloat, h: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        return setConstraints([
            widthAnchor.constraint(equalToConstant: w),
            heightAnchor.constraint(equalToConstant: h)
        ])
    }
    
    @available(iOS 11, *)
    @discardableResult
    func setPosition(top: CGFloat? = nil, right: CGFloat? = nil, bottom: CGFloat? = nil, left: CGFloat? = nil) -> UIView {
        guard let superView = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        
        var newConstraints: [NSLayoutConstraint] = []
        
        if let top = top {
            newConstraints.append(topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: top))
        }
        
        if let right = right {
            newConstraints.append(rightAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.rightAnchor, constant: right))
        }
        
        if let bottom = bottom {
            newConstraints.append(bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: bottom))
        }
        
        if let left = left {
            newConstraints.append(leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor, constant: left))
        }
        
        return setConstraints(newConstraints)
    }
    
    @discardableResult
    func fillSuperView(top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0, left: CGFloat = 0) -> UIView {
        guard let superView = superview else { return self }
        translatesAutoresizingMaskIntoConstraints = false
        return setConstraints([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: top),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: right),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: left),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom)
        ])
    }
    
    @discardableResult
    func fillSafeArea(_ safeAreaInsets: UILayoutGuide) -> UIView {
        return setConstraints([
            topAnchor.constraint(equalTo: safeAreaInsets.topAnchor),
            trailingAnchor.constraint(equalTo: safeAreaInsets.trailingAnchor),
            leadingAnchor.constraint(equalTo: safeAreaInsets.leadingAnchor),
            bottomAnchor.constraint(equalTo: safeAreaInsets.bottomAnchor)
        ])
    }
    
    
    @discardableResult
    func addToView(_ view: UIView) -> UIView {
        view.addSubview(self)
        return self
    }
    
    @discardableResult
    func addTo(view: UIView) -> Self {
        view.addSubview(self)
        return self
    }
    
    @discardableResult
    func setHeight(_ height:CGFloat) -> UIView {
        return setConstraints(heightAnchor.constraint(equalToConstant: height))
    }
    
    @discardableResult
    func setWidth(_ width:CGFloat) -> UIView {
        return setConstraints(widthAnchor.constraint(equalToConstant: width))
    }
    
    @discardableResult
    func size(_ size: CGSize) -> UIView {
        return setWidth(size.width).setHeight(size.height)
    }
    
    @discardableResult
    func square(_ size: CGFloat) -> UIView {
        return setWidth(size).setHeight(size)
    }
    
    @discardableResult
    func square(ofSize size: CGFloat) -> UIView {
        return setWidth(size).setHeight(size)
    }
    
    @discardableResult
    func cornerRadius(of radius: CGFloat) -> UIView {
        layer.cornerRadius = radius
        return self
    }
    
    @discardableResult
    func bringToFront() -> UIView {
        guard let superView = superview else { return self }
        superView.bringSubviewToFront(self)
        return self
    }
}

// MARK: - BoxShadow
extension UIView {
    func addShadow(offset: CGSize = CGSize(width: 0, height: 0), opacity: Float = 0.2, radius: CGFloat = 5, shadowColor: UIColor = .black) {
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
    
    func addShadow(offset: CGSize = CGSize(width: 0, height: 0), opacity: Float = 0.25, radius: CGFloat = 10, spread: CGFloat = -2) {
        layer.applySketchShadow(offset: offset, opacity: opacity, radius: radius, spread: spread)
    }
    
    func addShadow(boxShadow shadow: BoxShadow) {
        layer.applySketchShadow(offset: shadow.offset, opacity: shadow.opacity, radius: shadow.blur, spread: shadow.spread)
    }
    
    func removeShadow() {
        layer.shadowPath = nil
        layer.shadowColor = nil
        layer.shadowRadius = 0
        layer.shadowOpacity = 0
    }
}

// MARK: - Corners
extension UIView {
    enum Corner: Int {
        case bottomRight
        case topRight
        case bottomLeft
        case topLeft
    }
     
    enum Side: Int {
        case top
        case left
        case bottom
        case right
   }

   private func parseCorner(corner: Corner) -> CACornerMask.Element {
       let corners: [CACornerMask.Element] = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
       return corners[corner.rawValue]
   }

   private func createMask(corners: [Corner]) -> UInt {
       return corners.reduce(0, { (a, b) -> UInt in
           return a + parseCorner(corner: b).rawValue
       })
   }

    @available(iOS 11, *)
    @discardableResult
    func roundCorners(corners: [Corner], radius amount: CGFloat = 5) -> UIView {
        
        layer.cornerRadius = amount
        let maskedCorners: CACornerMask = CACornerMask(rawValue: createMask(corners: corners))
        layer.maskedCorners = maskedCorners
        
        return self
    }
    
    @discardableResult
    func round(_ amount: CGFloat) -> UIView {
        layer.cornerRadius = amount
        return self;
    }
    
    @available(iOS 11, *)
    @discardableResult
    func roundSide(side: Side, withRadius amount: CGFloat = 5) -> UIView {
        layer.cornerRadius = amount
        
        var mask: UInt = 0
        
        switch side {
        case .top:
            mask = createMask(corners: [.topLeft, .topRight])
            break
        case .left:
            mask = createMask(corners: [.topLeft, .bottomLeft])
            break
        case .bottom:
            mask = createMask(corners: [.bottomLeft, .bottomRight])
            break
        case .right:
            mask = createMask(corners: [.bottomRight, .topRight])
            break
        }
        
        let maskedCorners: CACornerMask = CACornerMask(rawValue: mask)
        
        layer.maskedCorners = maskedCorners
        
        return self;
    }
}

extension CALayer {
    func addShadow(offset: CGSize = CGSize(width: 0, height: 0), opacity: Float = 0.2, radius: CGFloat = 5) {
        shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowColor = UIColor.black.cgColor
        shadowOffset = offset
        shadowRadius = radius
        shadowOpacity = opacity
    }
 
    func applySketchShadow(offset: CGSize = CGSize(width: 0, height: 0), opacity: Float = 0.2, radius: CGFloat = 5, spread: CGFloat = 0) {
        shadowColor = UIColor.black.cgColor
        shadowOpacity = opacity
        shadowOffset = offset
        shadowRadius = radius
            
        if spread == 0 {
            shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            return
        }
        
        let dx = -spread
        let rect = bounds.insetBy(dx: dx, dy: dx)
        shadowPath = UIBezierPath(rect: rect).cgPath
    }
}

