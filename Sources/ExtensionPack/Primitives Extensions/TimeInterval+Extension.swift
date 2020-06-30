//
//  TimeInterval+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 30/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation

extension TimeInterval{
    func toString() -> String {
        let time = NSInteger(self)

        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        if hours == 0 {
            return "\(minutes) minutes"
        }

        return "\(hours)h \(minutes)m"
    }
}

