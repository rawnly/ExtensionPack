//
//  ButtonCell.swift
//  Vallelunga
//
//  Created by Federico Vitale on 31/10/2019.
//  Copyright © 2019 Federico Vitale. All rights reserved.
//
#if !os(macOS)

import Foundation
import UIKit

public class ButtonCell: ThemedTableCell {
    public var isEnabled: Bool = true {
        didSet {
            if ( isEnabled == false ) {
                selectionStyle = .none
                textLabel?.textColor = .gray
            } else {
                
                if #available(iOS 13, *) {
                    textLabel?.textColor = .label
                } else {
                    textLabel?.textColor = .black
                }
                
                selectionStyle = .blue
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        textLabel?.textAlignment = .center
        textLabel?.textColor = themeColor
        textLabel?.font = .systemFont(ofSize: 17)
        
        let view = UIView()
        view.backgroundColor = themeColor.withAlphaComponent(0.1)
        selectedBackgroundView = view
        selectionStyle = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
