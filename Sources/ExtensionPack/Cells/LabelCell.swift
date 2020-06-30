//
//  LabelCell.swift
//  Vallelunga
//
//  Created by Federico Vitale on 31/10/2019.
//  Copyright © 2019 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

class LabelCell: ThemedTableCell {
    var primaryLabel: UILabel = UILabel()
    var secondaryLabel: UILabel = UILabel()
    
    private var spinner: UIActivityIndicatorView = .init(style: .gray)
    private var stack: UIStackView = UIStackView()
    
    public var isLoading: Bool = false {
        didSet {
            if isLoading {
                setupLoader()
            } else {
                setupSecondaryLabel()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LabelCell {
    fileprivate func setupViews() {
        setupStack()
        setupPrimaryLabel()
        setupSecondaryLabel()
    }
    
    fileprivate func setupStack() {
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        stack
            .addToView(self)
            .centerInSuperView(axis: .vertical)
            .setConstraints([
                stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ])
    }
    
    fileprivate func setupPrimaryLabel() {
        primaryLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        primaryLabel.textColor = Colors.primaryLabel
        
        stack.addArrangedSubview(primaryLabel)
    }
    
    fileprivate func setupSecondaryLabel() {
        spinner.stopAnimating()
        
        secondaryLabel.font = .systemFont(ofSize: 14, weight: .regular)
        secondaryLabel.textColor = Colors.secondaryLabel
        
        stack.removeArrangedSubview(spinner)
        stack.addArrangedSubview(secondaryLabel)
    }
    
    fileprivate func setupLoader() {
        spinner.startAnimating()
        
        stack.removeArrangedSubview(secondaryLabel)
        stack.addArrangedSubview(spinner)
    }
}
