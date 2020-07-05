//
//  Date+Extension.swift
//  BookMyTrack
//
//  Created by Federico Vitale on 01/03/2020.
//  Copyright © 2020 Federico Vitale. All rights reserved.
//

import Foundation

/*
 * -----------------------
 * MARK: - Calendar Stuff
 * ------------------------
 */
public extension Date {
    init(_ string: String, format: String = "yyyy/MM/dd") {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        self = dateFormatter.date(from: string) ?? Date()
    }
    
    init(time t: Double) {
        self.init(timeIntervalSince1970: t)
    }
}

public extension Date {
    private var calendar: Calendar {
        return Calendar.current
    }
    
    var weekDay: Int {
        return calendar.component(.weekday, from: self)
    }
    
    var weekOfMonth: Int {
        return calendar.component(.weekOfMonth, from: self)
    }
    
    var weekOfYear: Int {
        return calendar.component(.weekOfYear, from: self)
    }
    
    var year: Int {
        return calendar.component(.year, from: self)
    }
    
    var month: Int {
        return calendar.component(.month, from: self)
    }
    
    var quarter: Int {
        return calendar.component(.quarter, from: self)
    }
    
    var day: Int {
        return calendar.component(.day, from: self)
    }
    
    var era: Int {
        return calendar.component(.era, from: self)
    }
    
    var hours: Int {
        return calendar.component(.hour, from: self)
    }
    
    var minutes: Int {
        return calendar.component(.minute, from: self)
    }
    
    var seconds: Int {
        return calendar.component(.second, from: self)
    }
    
    var nanoseconds: Int {
        return calendar.component(.nanosecond, from: self)
    }
}


/*
 * -----------------------
 * MARK: - Utility
 * ------------------------
 */
public extension Date {
    static var now: Date {
        return self.init()
    }
    
    var stringTime: String {
        return getStringTime(showSeconds: false)
    }
    
    var stringTimeWithSeconds: String {
        return getStringTime(showSeconds: true)
    }
    
    var timestamp: TimeInterval {
        return timeIntervalSince1970
    }
    
    var millisecondsSince1970:Int {
        return Int(self.timeIntervalSince1970 * 1000)
    }
    
    enum TimeQuantity {
        case years(Int)
        case weeks(Int)
        case days(Int)
        case hours(Int)
        case minutes(Int)
        case seconds(Int)
    }
    
    enum Time: Double{
        case year = 31536000
        case week = 604800
        case day = 86400
        case hour = 3600
        case minute = 60
        case second = 1
    }
    
    func add(_ time: TimeQuantity) -> Self {
        switch time {
        case .years(let qty):
            return addingTimeInterval(Time.year.rawValue * Double(qty))
        case .weeks(let qty):
            return addingTimeInterval(Time.week.rawValue * Double(qty))
        case .days(let qty):
            return addingTimeInterval(Time.day.rawValue * Double(qty))
        case .hours(let qty):
            return addingTimeInterval(Time.hour.rawValue * Double(qty))
        case .minutes(let qty):
            return addingTimeInterval(Time.minute.rawValue * Double(qty))
        case .seconds(let qty):
            return addingTimeInterval(Time.second.rawValue * Double(qty))
        }
    }
    
    
    var isMorning: Bool {
        let symbol = calendar.amSymbol.lowercased()
        
        if symbol == "am" {
            return true
        } else if symbol == "pm" {
            return false
        } else if hours > 14 {
            return false
        }
            
        return true
    }
    
    private func getStringTime(showSeconds: Bool = false) -> String {
        var time = "\(hours.safeString):\(minutes.safeString)"
        
        if showSeconds {
            time += ":\(seconds.safeString)"
        }
        
        return time
    }
    
    func toString(_ dateFormat: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        return dateFormatter.string(from: self)
    }
    
    func toString(_ dateStyle: DateFormatter.Style = .long, _ hoursStyle: DateFormatter.Style = .none) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = hoursStyle
        
        return dateFormatter.string(from: self)
    }
    
    static func convert(from inputFormat: String, to outputFormat: String, date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        guard let outputDate = dateFormatter.date(from: date) else {
            return date
        }
        
        return outputDate.toString(outputFormat)
    }
    
    static func convertLocale(from inputFormat: String, date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        guard let outputDate = dateFormatter.date(from: date) else {
            return date
        }
        
        return outputDate.toString()
    }
    
    static func getDayOfWeek(_ today:String, format inputFormat: String = "yyyy-MM-dd") -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = inputFormat
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    
    var yearsSinceNow: Int {
        timeIntervalSinceNow.years
    }
    
    var daysSinceNow: Int {
        timeIntervalSinceNow.days
    }
        
    var weeksSinceNow: Int {
        timeIntervalSinceNow.weeks
    }
    
    var hoursSinceNow: Int {
        timeIntervalSinceNow.hours
    }
    
    var timeSinceNow: String {
        let days = Int(timeIntervalSinceNow / Time.day.rawValue)
        let hours = Int(timeIntervalSinceNow.truncatingRemainder(dividingBy: Time.day.rawValue) / Time.hour.rawValue);
        
        return "\(days < 10 ? "0\(days)" : "\(days)")d \(hours < 10 ? "0\(hours)" : "\(hours)")h"
    }
}


public extension TimeInterval {
    var years: Int {
        Int(self / Date.Time.year.rawValue)
    }
    
    var weeks: Int {
        Int(self / Date.Time.week.rawValue)
    }
    
    var days: Int {
        Int(self / Date.Time.day.rawValue)
    }
    
    var hours: Int {
        Int(self / Date.Time.hour.rawValue)
    }
    
    var minutes: Int {
        Int(self / Date.Time.minute.rawValue)
    }
    
    var seconds: Int {
        Int(self)
    }
    
    func toString(
        display items: Date.Time...
    ) -> String {
        var finalString: String = ""
                                
        if items.contains(.year) {
            let years = Int(self
                / Date.Time.year.rawValue
            )
            
            finalString += "\(years)y"
        }
        
        if items.contains(.week) {
            let weeks = Int(self
                .truncatingRemainder(dividingBy: Date.Time.year.rawValue)
                / Date.Time.week.rawValue
            )
            
            finalString += " \(weeks)y"
        }
        
        if items.contains(.day) {
            let days = Int(self
               .truncatingRemainder(dividingBy: Date.Time.year.rawValue)
               .truncatingRemainder(dividingBy: Date.Time.week.rawValue)
               / Date.Time.day.rawValue
           )
            
            finalString += " \(days)d"
        }
        
        if items.contains(.hour) {
            let hours = Int(self
                .truncatingRemainder(dividingBy: Date.Time.year.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.week.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.day.rawValue)
                / Date.Time.hour.rawValue
            )
            
            finalString += " \(hours)h"
        }
        
        if items.contains(.minute) {
            let minutes = Int(self
                .truncatingRemainder(dividingBy: Date.Time.year.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.week.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.day.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.hour.rawValue)
                / Date.Time.minute.rawValue
            )
                        
            finalString += " \(minutes)m"
        }
        
        if items.contains(.second) {
            let seconds = Int(self
                .truncatingRemainder(dividingBy: Date.Time.year.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.week.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.day.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.hour.rawValue)
                .truncatingRemainder(dividingBy: Date.Time.minute.rawValue)
                / Date.Time.second.rawValue
            )
            
            finalString += " \(seconds)s"
        }
        
        return finalString
    }
}
