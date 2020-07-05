//
//  ToggleCell.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 28/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public class ToggleCell: ThemedTableCell {
    public let toggle = UISwitch()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        setupToggle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupToggle() {
        accessoryView = toggle
        accessoryType = .none
        
        toggle.onTintColor = themeColor
    }
}

#endif
