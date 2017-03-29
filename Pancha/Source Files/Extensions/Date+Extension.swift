//
//  Date+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/28/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation

public extension Date{
    
    //subscripts
    
    subscript(format:String)->String{
        get{
            return self.stringWithFormat(format: format)
        }
    }
    
    static func monthName(monthIndex:Int)->String{
        let dateFormatter = DateFormatter()
        return dateFormatter.monthSymbols[monthIndex]
    }
    
    static func dayName(dayIndex:Int)->String{
        let dateFormatter = DateFormatter()
        return dateFormatter.weekdaySymbols[dayIndex]
    }
    
    static func dateFromIso8681Timestamp(dateString:String)->Date{
        return Date.dateFromString(dateString: dateString, withFormat: "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'")!
    }
    
    init(fromIso8681Timestamp: String) {
        self.init()
    }
    
    static func dateFromString(dateString:String,withFormat format:String)->Date?{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString) as Date?
    }
    
    static func dateFromString(dateString:String,withFormat format:String, timeZone:TimeZone)->Date?{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: dateString)
    }
    
    static func dateWithYear(year:Int, month:Int, day:Int, hour:Int, minute:Int, second:Int)->Date{
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let date:Date = calendar.date(from: dateComponents)!
        
        return date
        
    }
    
    public var iso8681Timestamp:String{
        
        get{
            return self.stringWithFormat(format: "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'")
        }
        
    }
    
    public var year:Int {
        
        get{
            
            let units:Set<Calendar.Component> = [.year]
            return Calendar.current.dateComponents(units, from: self).year!
            
        }
        
    }
    
    public var month:Int {
        
        get{
            let units:Set<Calendar.Component> = [.month]
            return Calendar.current.dateComponents(units, from: self).month!
        }
        
    }
    
    public var monthName:String{
        
        get{
            return Date.monthName(monthIndex: self.month)
        }
        
    }
    
    public var weekOfYear:Int{
        
        get{
            let units:Set<Calendar.Component> = [.weekOfYear]
            return Calendar.current.dateComponents(units, from: self).weekOfYear!
        }
        
    }
    
    public var weekOfMonth:Int{
        
        get{
            let units:Set<Calendar.Component> = [.weekOfMonth]
            return Calendar.current.dateComponents(units, from: self).weekOfMonth!
        }
        
    }
    
    public var dayInWeek:Int{
        
        get{
            let units:Set<Calendar.Component> = [.weekday]
            return Calendar.current.dateComponents(units, from: self).weekday!
        }
        
    }
    
    public var weekDayOrdinal:Int{//1-7->1, 8-14->2..etc
        
        get{
            let units:Set<Calendar.Component> = [.weekdayOrdinal]
            return Calendar.current.dateComponents(units, from: self).weekdayOrdinal!
        }
        
    }
    
    public var day:Int {
        
        get{
            let units:Set<Calendar.Component> = [.day]
            return Calendar.current.dateComponents(units, from: self).day!
        }
        
    }
    
    public var dayName:String{
        
        get{
            return Date.dayName(dayIndex: self.day)
        }
        
    }
    
    public var hour:Int {
        
        get{
            let units:Set<Calendar.Component> = [.hour]
            return Calendar.current.dateComponents(units, from: self).hour!
        }
        
    }
    
    public var minute:Int {
        
        get{
            let units:Set<Calendar.Component> = [.minute]
            return Calendar.current.dateComponents(units, from: self).minute!
        }
        
    }
    
    public var second:Int {
        
        get{
            let units:Set<Calendar.Component> = [.second]
            return Calendar.current.dateComponents(units, from: self).second!
        }
        
    }
    
    
    public var nextDay:Date{
        
        get{
            return self.date(byAddingYears: 0, months: 0, days: 1) as Date
        }
        
    }
    
    public var nextWorkingDay:Date{
        
        get{
            var nextDay = self.nextDay
            if nextDay.isWeekEnd {
                let datesToAdd = nextDay.isSaturday ? 2 : 1
                nextDay = nextDay.date(byAddingYears: 0, months: 0, days: datesToAdd)
            }
            return nextDay
        }
        
    }
    
    public var previousDay:Date{
        
        get{
            return self.date(byAddingYears: 0, months: 0, days: -1)
        }
        
    }
    
    public var nextWeek:Date{
        
        get{
            return self.date(byAddingWeeks: 1)
        }
        
    }
    
    public var previousWeek:Date{
        
        get{
            return self.date(byAddingWeeks: -1)
        }
        
    }
    
    public var nextMonth:Date{
        
        get{
            return self.date(byAddingYears: 0, months: 1, days: 0)
        }
        
    }
    
    public var previousMonth:Date{
        
        get{
            return self.date(byAddingYears: 0, months: -1, days: 0)
        }
        
    }
    
    public func stringWithFormat(format:String)->String{
        
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)
        return dateString
        
        
    }
    
    public func printDateInCurrentLocale(){
        print(self.description(with: Locale.current))
    }
    
    public func date(byAddingYears years:Int, months:Int, days:Int)->Date{
        
        
        var dateComponents = DateComponents()
        dateComponents.year = years
        dateComponents.month = months
        dateComponents.day = days
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(byAdding: dateComponents, to: self)!
        
        
    }
    
    public func date(byAddingHours hours:Int, minutes:Int, seconds:Int)->Date{
        
        
        var dateComponents = DateComponents()
        dateComponents.hour = hours
        dateComponents.minute = minutes
        dateComponents.second = seconds
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(byAdding: dateComponents, to: self)!
        
    }
    
    
    public func date(byAddingWeeks weeks:Int)->Date{
        
        
        var dateComponents = DateComponents()
        dateComponents.weekdayOrdinal = weeks
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.date(byAdding: dateComponents, to: self)!
        
        
    }
    
    
    //only date
    public var onlyDate:Date{
        
        get{
            let calendar = Calendar.current
            let units:Set<Calendar.Component> = [.hour, .minute, .second]
            var components = calendar.dateComponents(units, from: self)
            
            components.hour = 0
            components.minute = 0
            components.second = 0
            
            return calendar.date(from: components)!
        }
        
    }
    
    //only time
    public var onlyTime:Date{
        
        get{
            let calendar = Calendar.current
            let units:Set<Calendar.Component> = [.year, .month, .day]
            var components = calendar.dateComponents(units, from: self)
            
            components.hour = 0
            components.minute = 0
            components.second = 0
            
            return calendar.date(from: components)!
        }
        
    }
    
    /*
     
     NSCalendar *calendar = [NSCalendar currentCalendar];
     NSCalendarUnit calendarUnits = NSCalendarUnitTimeZone | NSCalendarUnitYear | NSCalendarUnitMonth
     | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
     DateComponents *components = [calendar components:calendarUnits
     fromDate:[Date date]];
     components.hour += 3;
     Date *threeHoursFromNow = [calendar dateFromComponents:components];
     
     */
    
    /*
     
     Things to remember
     - MatchStrictly
     - MatchNextTime
     - MatchNextTimePreservingSmallerUnits
     - MatchPreviousTimePreservingSmallerUnits
     
     */
    
    public var isYesterday:Bool{
        
        get{
            let date:Date = Date().date(byAddingYears: 0, months: 0, days: -1)
            return self.isSameDate(date: date)
        }
        
    }
    
    public var isToday:Bool{
        
        get{
            return self.isSameDate(date: Date())
        }
        
    }
    
    public var isTomorrow:Bool{
        
        get{
            let date:Date = Date().date(byAddingYears: 0, months: 0, days: 1)
            return self.isSameDate(date: date)
        }
        
    }
    
    public var isLastMonth:Bool{
        
        get{
            let date:Date = Date().date(byAddingYears: 0, months: -1, days: 0)
            return self.isSameMonth(date: date)
        }
        
    }
    
    public var isThisMonth:Bool{
        
        get{
            return self.isSameMonth(date: Date())
        }
        
    }
    
    public var isNextMonth:Bool{
        
        get{
            let date:Date = Date().date(byAddingYears: 0, months: 1, days: 0)
            return self.isSameMonth(date: date)
        }
        
    }
    
    public var isThisYear:Bool{
        
        get{
            return self.isSameYear(date: Date())
        }
        
    }
    
    public func isSameDate(date:Date)->Bool{
        
        let equalDays:Bool = (self.day == date.day)
        return (equalDays && self.isSameMonth(date: date))
        
    }
    
    public func isSameWeek(date:Date)->Bool{
        
        let equalWeeks:Bool = (self.weekOfMonth == date.weekOfMonth)
        return (equalWeeks && self.isSameMonth(date: date))
        
    }
    
    public func isSameMonth(date:Date)->Bool{
        
        let equalMonths:Bool = (self.month == date.month)
        return (self.isSameYear(date: date) && equalMonths)
        
    }
    
    public func isSameYear(date:Date)->Bool{
        return (self.year == date.year)
    }
    
    public var isSunday:Bool{
        
        get{
            return (self.dayInWeek == 1)
        }
        
    }
    
    public var isMonday:Bool{
        
        get{
            return (self.dayInWeek == 2)
        }
        
    }
    
    public var isTuesday:Bool{
        
        get{
            return (self.dayInWeek == 3)
        }
        
    }
    
    public var isWednesday:Bool{
        
        get{
            return (self.dayInWeek == 4)
        }
        
    }
    
    public var isThursday:Bool{
        
        get{
            return (self.dayInWeek == 5)
        }
        
    }
    
    public var isFriday:Bool{
        
        get{
            return (self.dayInWeek == 6)
        }
        
    }
    
    public var isSaturday:Bool{
        
        get{
            return (self.dayInWeek == 7)
        }
        
    }
    
    public var isWeekEnd:Bool{
        
        get{
            return (self.isSunday || self.isSaturday)
        }
        
    }
    
    public var isWeekDay:Bool{
        
        get{
            return (self.isWeekEnd == false)
        }
        
    }
    
}
