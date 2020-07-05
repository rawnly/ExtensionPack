//
//  CheckBoxCell.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 02/05/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public class CheckBoxCell: ThemedTableCell {
    var value: Any? = nil
    var labelText: String? {
        didSet {
            self.textLabel?.text = labelText
        }
    }
    
    var checked: Bool = false {
        didSet {
            if checked {
                self.accessoryType = .checkmark
            } else {
                self.accessoryType = .none
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
