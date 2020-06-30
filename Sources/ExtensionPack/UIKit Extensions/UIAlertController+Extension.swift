//
//  UIAlertController+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 30/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Buttons
extension UIAlertController {
    func ok() {
        addAction(.ok)
    }
    
    @available(iOS 10, *)
    func settings(_ style: UIAlertAction.Style = .default) {
        addAction(.settings)
    }
}

// MARK: - Utilities
extension UIAlertController {
    static func errorAlert(with error: Error) -> UIAlertController {
        let alert = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
                
        alert.addActions(.cancel, .ok)
        
        return alert
    }
    
    func addActions(actions: UIAlertAction...) {
        for action in actions {
            addAction(action)
        }
    }
    
    func addActions(_ actions: UIAlertAction...) {
        for action in actions {
            addAction(action)
        }
    }
    
    func addActions(actions: [UIAlertAction]) {
        for action in actions {
            addAction(action)
        }
    }
    
    func present(in vc: UIViewController) {
        vc.present(self, animated: true)
    }
}


extension UIAlertAction {
    static let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    static let ok = UIAlertAction(title: "Ok", style: .default)
    
    @available(iOS 10, *)
    static let settings = UIAlertAction(title: "Settings", style: .default) { (_) in UIApplication.openSettings() }
    
    static func ok(handler: @escaping (UIAlertAction) -> Void) -> UIAlertAction {
        return UIAlertAction(title: "Ok", style: .default, handler: handler)
    }
        
    @available(iOS 10, *)
    convenience init(title: String, url: URL, _ style: Style = .default) {
        self.init(title: title, style: style) { _ in
            url.safeOpen(completion: nil) { _ in }
        }
    }
}
