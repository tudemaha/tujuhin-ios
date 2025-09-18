//
//  DateCalculation.swift
//  tujuhin
//
//  Created by Tude Maha on 18/09/2025.
//

import Foundation

class DateCalculation {
    static func getDuration(from start: Date, to end: Date) -> String {
        let diff = Calendar.current.dateComponents([.weekOfYear, .day, .hour, .minute, .second], from: start, to: end)
                
        if let weeks = diff.weekOfYear, weeks > 0 {
            return "\(weeks)w"
        } else if let days = diff.day, days > 0 {
            return "\(days)d"
        } else if let hours = diff.hour, hours > 0 {
            return "\(hours)h"
        } else if let minutes = diff.minute, minutes > 0 {
            return "\(minutes)m"
        } else if let seconds = diff.second, seconds > 0 {
            return "\(seconds)s"
        }
        else {
            return "0s"
        }
    }
}
