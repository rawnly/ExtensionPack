//
//  DockIcon.swift
//  County
//
//  Created by Federico Vitale on 20/07/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if os(macOS)

import Foundation
import Cocoa
import Combine
import SwiftUI


@available(OSX 10.15, *)
struct DockIcon {
    enum Visibility {
        case visible
        case hidden
    }
    
    static var isVisible: Bool {
        get {
            return NSApp.activationPolicy() == .regular
        }
        
        set {
            setVisibility(newValue ? .visible : .hidden)
        }
    }
    
    static var visibility: Visibility {
        get {
            NSApp.activationPolicy() == .regular ? .visible : .hidden
        }
        
        set {
            setVisibility(newValue)
        }
    }
    
    @discardableResult
    private static func setVisibility(_ state: Visibility) -> Bool {
        switch state {
        case .visible:
            NSApp.setActivationPolicy(.regular)
            break
        case .hidden:
            NSApp.setActivationPolicy(.accessory)
            break
        }
        
        return NSApp.activationPolicy() == .regular
    }
}

#endif

