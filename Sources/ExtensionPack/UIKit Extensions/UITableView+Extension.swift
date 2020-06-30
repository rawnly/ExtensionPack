//
//  UITableView+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 03/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    var titleLabelColor: UIColor {
        if #available(iOS 13, *) {
            return .label
        }
        
        return .black
    }
    
    var messageLabelColor: UIColor {
        if #available(iOS 13, *) {
            return .secondaryLabel
        }
        
        return .lightGray
    }
    
    var imageViewTintColor: UIColor {
        if #available(iOS 13, *) {
            return .tertiaryLabel
        }
        
        return .lightText
    }
    
    var buttonColor: UIColor {
        if #available(iOS 13, *) {
            return .systemBlue
        }
        
        return .blue
    }
    
    func emptyViewMessage(title: String, message: String) {
        let emptyView = UIView(frame:
            CGRect(
                x: self.center.x,
                y: self.center.y,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            )
        )
                
        let titleLabel = UILabel(title)
        
        titleLabel.textColor = titleLabelColor
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
                
        let messageLabel = UILabel(message)
        
        messageLabel.textColor = messageLabelColor
        messageLabel.font = .systemFont(ofSize: 16, weight: .medium)
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, messageLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        stackView
            .addToView(emptyView)
            .centerInSuperView()
            .setConstraints([
                stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100)
            ])
        
        backgroundView = emptyView
    }
    
    func emptyViewMessage(icon: UIImage?, title: String, message: String, buttonText: String, onTap: @escaping ((UIButton) -> Void)) {
        /// Container
        let emptyView = UIView(frame: CGRect(origin: center, size: bounds.size))
        
        /// Icon ImageView
        let imageView: UIImageView = {
            let imageView = UIImageView(image: icon)
            imageView.tintColor = imageViewTintColor
            
            imageView.setConstraints([
                imageView.widthAnchor.constraint(equalToConstant: 120 * 2),
                imageView.heightAnchor.constraint(equalToConstant: 120 * 2)
            ])
            
            return imageView;
        }()

        
        /// Title Label
        let titleLabel: UILabel = {
            let label = UILabel(title, font: .systemFont(ofSize: 20, weight: .semibold))
            
            label.textColor = titleLabelColor
            label.textAlignment = .center
            label.numberOfLines = 0
            
            return label
        }()
                 
        /// Message Label
        let messageLabel: UILabel = {
            let label = UILabel(message, font: .systemFont(ofSize: 16, weight: .medium))
            
            label.textColor = messageLabelColor
            label.textAlignment = .center
            label.numberOfLines = 0
            
            return label
        }()
        
        /// Button
        let button: UIButton = {
            var button = UIButton(buttonText);
            
            button.on(.touchUpInside, onTap)
            button.setTitleColor(buttonColor, for: .normal)
            
            return button
        }()
        
        /// StackView
        let stackView: UIStackView = {
           let stack = UIStackView(arrangedSubviews: [imageView, titleLabel, messageLabel, button])
            
            stack.axis = .vertical
            stack.alignment = .center
            stack.spacing = 8
            
            return stack
        }()
        
        
        
        // Constraints
        stackView
            .addToView(emptyView)
            .centerInSuperView()
            .setConstraints([
                stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100)
            ])
        
        // Finalize
        backgroundView = emptyView
    }
    
    func emptyViewMessage(icon: UIImage?, title: String, message: String) {
        // This will contain our views
        let emptyView = UIView(frame:
            CGRect(
                x: self.center.x,
                y: self.center.y,
                width: self.bounds.size.width,
                height: self.bounds.size.height
            )
        )
        
        // Icon
        let imageView = UIImageView(image: icon)
        imageView.tintColor = imageViewTintColor
        
        imageView.setConstraints([
            imageView.widthAnchor.constraint(equalToConstant: 120 * 2),
            imageView.heightAnchor.constraint(equalToConstant: 120 * 2)
        ])
            
        let titleLabel: UILabel = {
            let label = UILabel(title, font: .systemFont(ofSize: 20, weight: .semibold))
            
            label.textColor = titleLabelColor
            label.textAlignment = .center
            label.numberOfLines = 0
            
            return label
        }()
                        
        let messageLabel: UILabel = {
            let label = UILabel(message, font: .systemFont(ofSize: 16, weight: .medium))
            
            label.textColor = messageLabelColor
            label.textAlignment = .center
            label.numberOfLines = 0
            
            return label
        }()
        
        // Stack View
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, messageLabel])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        // Constraints
        stackView
            .addToView(emptyView)
            .centerInSuperView()
            .setConstraints([
                stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100)
            ])
        
        // Finalize
        backgroundView = emptyView
    }
    
    func emptyViewMessage(title: String, message: String, buttonText: String, onTap: @escaping ((UIButton) -> Void)) {
        let emptyView = UIView(frame: CGRect(origin: center, size: bounds.size))
                
        let titleLabel: UILabel = {
            let label = UILabel(title, font: .systemFont(ofSize: 20, weight: .semibold))
            
            label.textColor = titleLabelColor
            label.textAlignment = .center
            label.numberOfLines = 0
            
            return label
        }()
                        
        let messageLabel: UILabel = {
            let label = UILabel(message, font: .systemFont(ofSize: 16, weight: .medium))
            
            label.textColor = messageLabelColor
            label.textAlignment = .center
            label.numberOfLines = 0
            
            return label
        }()
        
        let button: UIButton = {
            var button = UIButton(buttonText);
            
            button.on(.touchUpInside, onTap)
            button.setTitleColor(buttonColor, for: .normal)
            
            return button
        }()
                
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            messageLabel,
            button
        ])
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        
        stackView
            .addToView(emptyView)
            .centerInSuperView()
            .setConstraints([
                stackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100)
            ])
        
        backgroundView = emptyView
    }
    
    func startLoading() {
        let emptyView = UIView(
            frame: CGRect(
                x: center.x,
                y: center.y,
                width: bounds.size.width,
                height: bounds.size.height
            )
        )
        
        var spinnerStyle: UIActivityIndicatorView.Style = .gray
        if #available(iOS 13, *) {
            spinnerStyle = .large
        }
        
        let spinner = UIActivityIndicatorView(style: spinnerStyle)
        
        spinner
            .addToView(emptyView)
            .centerInSuperView()
        
        spinner.startAnimating()
        
        backgroundView = emptyView
    }
    
    func restore() {
        backgroundView = nil
    }
}

