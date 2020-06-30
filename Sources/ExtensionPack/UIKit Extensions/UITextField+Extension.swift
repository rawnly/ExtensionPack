//
//  UITextField+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 26/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

class UITextFieldWithPadding: UITextField {
    var padding: UIEdgeInsets = .zero

    convenience init(padding inset: UIEdgeInsets = .init(top: 5, left: 10, bottom: 5, right: 10)) {
        self.init(frame: .zero)
        self.padding = inset
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


extension UITextField {
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    @discardableResult
    func setPadding(to padding: UIEdgeInsets) -> Self {
        let paddedBounds = bounds.inset(by: padding);
        
        editingRect(forBounds: paddedBounds)
        placeholderRect(forBounds: paddedBounds)
        textRect(forBounds: paddedBounds)
        
        return self
    }
    
    @discardableResult
    func setPlaceholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult
    func setText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    func setKeyboard(
        ofType keyboardType: UIKeyboardType,
        withReturnKey returnKeyType: UIReturnKeyType = .default,
        withAppearance appearance: UIKeyboardAppearance = .default
    ) -> Self {
        self.keyboardType = keyboardType;
        self.keyboardAppearance = appearance;
        self.returnKeyType = returnKeyType
        return self
    }
    
    @discardableResult
    func setTintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor;
        return self
    }
    
    @discardableResult
    func setTextColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor;
        return self
    }
    
    @discardableResult
    func setTextAlignment(to textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment;
        return self
    }
    
    @discardableResult
    func setAutoCapitalization(ofType autocapitalizationType: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = autocapitalizationType;
        return self
    }
    
    @discardableResult
    func setAutoCorrection(ofType autocorrectionType: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = autocorrectionType;
        return self
    }
}


