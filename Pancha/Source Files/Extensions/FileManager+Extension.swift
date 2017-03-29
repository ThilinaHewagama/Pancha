//
//  NSFileManager+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/28/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation

public extension FileManager {

    class var documentDirectoryPath:String{
        
        get{
            var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
            return paths[0]
        }
        
    }
    
    class var applicationSupportDirectoryPath:String{
        
        get{
            var paths = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true) as [String]
            return paths[0]
        }
        
    }
    
    class var cacheDirectoryPath:String{
        
        get{
           
            var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
            return paths[0]
            
        }
        
    }
    
}
