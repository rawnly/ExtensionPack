//
//  ThemedTableCelll.swift
//  Name Manager
//
//  Created by Federico Vitale on 11/06/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit


class ThemedTableCell : UITableViewCell {
    internal var themeColor: UIColor { .systemBlue }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


