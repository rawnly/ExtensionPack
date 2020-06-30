//
//  DetailedCell.swift
//  Name Manager
//
//  Created by Federico Vitale on 11/06/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

class DetailedCell: ThemedTableCell {
    var title: String? {
        didSet {
            self.textLabel?.text = title
        }
    }
    
    var subTitle: String? {
        didSet {
            self.detailTextLabel?.text = subTitle
        }
    }
    
    var extra: String? {
        didSet {
            self.extraLabel.text = extra
        }
    }
    
    var extraLabel: UILabel = {
        let label = UILabel("", font: .systemFont(ofSize: 16, weight: .regular))
        
        label.numberOfLines = 1
        label.textColor = Colors.tertiaryLabel
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier);
        
        textLabel?.textColor = Colors.primaryLabel
        textLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        
        detailTextLabel?.textColor = Colors.secondaryLabel
        detailTextLabel?.font = .systemFont(ofSize: 15, weight: .regular)

        extraLabel
            .addToView(self)
            .centerInSuperView(axis: .vertical)
            .anchor(to: [.right], margin: 40)
        
        accessoryType = .disclosureIndicator
    }
    
    /// DO NOT USE
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

internal struct Colors {
    static var primaryLabel: UIColor {
        if #available(iOS 13, *) {
            return .label
        }
        
        return .black
    }
    
    static var secondaryLabel: UIColor {
        if #available(iOS 13, *) {
            return .secondaryLabel
        }
        
        return .gray
    }
    
    static var tertiaryLabel: UIColor {
        if #available(iOS 13, *) {
            return .tertiaryLabel
        }
        
        return .lightGray
    }
}
