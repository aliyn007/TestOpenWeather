//
//  GenerateDayHours.swift
//  TestOpenWeather
//
//  Created by Александр on 25.03.2022.
//

import UIKit

extension Date {
//    var millisecondsSince1970:Int {
//        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
//    }
//
//    init(milliseconds:Int) {
//        self =  Date(timeIntervalSince1970: TimeInterval(milliseconds))
//        // milliseconds/1000
//    }
    
    static func getTodaysDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
    
    static func getHourFrom(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .none
        var string = dateFormatter.string(from: date)
        if string.last == "M" {
            string = String(string.prefix(string.count - 3))
        }
        return string
    }
    
    static func getDayOfWeekFrom(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = "MMM d, yyyy"
        var string = dateFormatter.string(from: date)
        if let index = string.firstIndex(of: ",") {
            string = String(string.prefix(upTo: index))
            return string
        }
        return "error"
    }
}
