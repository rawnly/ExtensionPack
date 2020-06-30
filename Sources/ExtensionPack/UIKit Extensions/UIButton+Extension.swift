//
//  UIButton+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 03/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit
import Combine

extension UIButton {
    convenience init(_ text: String) {
        self.init(frame: .zero)
        setTitle(text, for: .normal)
    }
}

@available(iOS 13, *)
class StyledButton: UIButton {
    enum ButtonStyle {
        case primary
        case secondary
    }
    
    @Published
    var style: ButtonStyle
    private var subs: [AnyCancellable] = []
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.8 : 1
        }
    }
    
    override var isUserInteractionEnabled: Bool {
        didSet {
            alpha = isUserInteractionEnabled ? 1 : 0.5
        }
    }
    
    
    
    init(_ title: String, withStyle style: ButtonStyle) {
        self.style = style;
        super.init(frame: .zero);
     
        setTitle(title, for: .normal)
        
        $style
               .receive(on: DispatchQueue.main)
               .sink(receiveValue: handleStyleChange)
               .store(in: &subs)
    }
    
    init(style: ButtonStyle) {
        self.style = style;
        super.init(frame: .zero);
        
        $style
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: handleStyleChange)
            .store(in: &subs)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Handle style change
    private func handleStyleChange(style: ButtonStyle) -> Void {
        setStyle(style: style)
    }
    
    // Modifiers
    @discardableResult
    public func disable() -> Self {
        isUserInteractionEnabled = false
        return self
    }
    
    @discardableResult
    public func setStyle(style: StyledButton.ButtonStyle) -> Self {
        switch style {
        case .primary:
            self.backgroundColor = .systemBlue
            self.setTitleColor(.white, for: .normal)
            break
        case .secondary:
            self.backgroundColor = .secondarySystemFill
            self.setTitleColor(.label, for: .normal)
            break
        }
        
        return self;
    }
}
