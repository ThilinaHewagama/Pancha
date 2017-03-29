//: Playground - noun: a place where people can play

import UIKit


extension String{

    var range: NSRange {
        get {
            return NSRange(location: 0, length: self.characters.count)
        }
    }
    
}

var str = "Hello, playground"


let text = "2014-01-16"

let dataDetector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
let matches = dataDetector.matches(in: text, options: .reportCompletion, range: text.range)

print(matches.first)

/*
 
 this support all following formats
 
 '2014-01-16' dateValue is <2014-01-16 11:00:00 +0000>
 '2014.01.16' dateValue is <2014-01-16 11:00:00 +0000>
 '2014/01/16' dateValue is <2014-01-16 11:00:00 +0000>
 '2014 Jan 16' dateValue is <2014-01-16 11:00:00 +0000>
 '2014 Jan 16th' dateValue is <2014-01-16 11:00:00 +0000>
 '20140116' dateValue is <2014-01-16 11:00:00 +0000>
 '01-16-2014' dateValue is <2014-01-16 11:00:00 +0000>
 '01.16.2014' dateValue is <2014-01-16 11:00:00 +0000>
 '01/16/2014' dateValue is <2014-01-16 11:00:00 +0000>
 '16 January 2014' dateValue is <2014-01-16 11:00:00 +0000>
 '01-16-2014 17:05:05' dateValue is <2014-01-16 16:05:05 +0000>
 '01-16-2014 T 17:05:05 UTC' dateValue is <2014-01-16 17:05:05 +0000>
 '17:05, 1 January 2014 (UTC)' dateValue is <2014-01-01 16:05:00 +0000>
 
 */