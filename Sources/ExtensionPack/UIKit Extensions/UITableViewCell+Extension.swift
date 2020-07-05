//
//  UITableViewCell+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 03/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
    
    static func register(to tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    static func register(_ tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    static func dequeque(from tableView: UITableView, at indexPath: IndexPath) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Self
    }
    
    static func dequequeFrom(_ tableView: UITableView, at indexPath: IndexPath) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? Self
    }
}

#endif
