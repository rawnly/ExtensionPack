//
//  URL+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 05/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

@available(iOS 10, *)
public extension URL {
    var canBeOpened: Bool {
        return UIApplication.shared.canOpenURL(self)
    }
    
    init(string main: String, fallback secondary: String) {
        let url = URL(string: main)
        let fallback = URL(string: secondary)
        
        if UIApplication.shared.canOpenURL(url!) {
            self = url!
        } else {
            self = fallback!
        }
    }
        
    func open(withFallback str: String) -> URL! {
        let fallback = URL(string: str)!
        
        if UIApplication.shared.canOpenURL(self) {
            return self
        }
        
        return fallback
    }
    
    
    func open(options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completion: ((Bool) -> Void)?) {
        UIApplication.shared.open(self, options: options, completionHandler: completion)
    }
    
    func safeOpen(options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completion: ((Bool) -> Void)?, onFail: @escaping (_ errorMessage: String) -> Void) {
        if self.canBeOpened {
            self.open(completion: completion)
            return
        }
        
        onFail("Can't open the URL")
    }
}

#endif
