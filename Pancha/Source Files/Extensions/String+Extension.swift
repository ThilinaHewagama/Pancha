//
//  String+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/28/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation

public extension String{
    
    public static func randomString(ofLength len : Int) -> NSString {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for _ in 0 ..< len {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return randomString
    }
    
    var dateValue:Date?{
        
        get{
            
            /*
             
             supports all following formats
             
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
            
            
            let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
            guard let detect = dataDetector else { return nil }
            let matches = detect.matches(in: self, options: .reportCompletion, range: self.range)
            
            if matches.first != nil {
                return matches.first?.date
            }else{
                return nil
            }
            
        }
        
    }
    
    var length: Int {
        
        get {
            return self.characters.count
        }

    }
    
    var range: NSRange {
        
        get {
            return NSRange(location: 0, length: self.length)
        }
        
    }
    
    func trim()->String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
    
    func contains(s: String) -> Bool{
        return (self.range(of: s) != nil) ? true : false
    }
    
    static func isString(object:AnyObject)->Bool{
        return object is String
    }
    
    var url:NSURL?{
        
        get{
             return NSURL(string: self)
        }
        
    }
    
    var pushToken:String{
       
        get{
            let token = self.trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
            return token.replacingOccurrences(of: " ", with: "")
        }
        
    }

    var number:NSNumber?{
        
        get{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = NumberFormatter.Style.decimal
            return numberFormatter.number(from: self)
        }
        
    }
    
    func isEqualToStringIgnoreCase(string:String)->Bool{
        return (self.caseInsensitiveCompare(string) == ComparisonResult.orderedSame)
    }
    
    //MARK: Validators
    
    var isValidURL:Bool{
        
        get{
            let url = NSURL(string: self)
            if (url != nil) && (url?.scheme != nil) && (url?.host != nil) {
                return true
            }else{
                return false
            }
        }
        
    }
    
    var isEmpty:Bool{
        
        get{
            return (self == "")
        }
        
    }
    
}
