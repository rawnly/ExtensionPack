//
//  String+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 30/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation

extension String {
    func style(_ attributes: [NSAttributedString.Key:Any]) -> NSAttributedString {
        let textRange = NSMakeRange(0, count)
        let attributedText = NSMutableAttributedString(string: self)
        attributedText.addAttributes(attributes, range: textRange)
        return attributedText;
    }
}
