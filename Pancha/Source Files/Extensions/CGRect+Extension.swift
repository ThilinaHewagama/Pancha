//
//  CGRect+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/29/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation
import UIKit

public extension CGRect{
    
    public var centerPoint:CGPoint{
        get{
            let centerX = self.origin.x + self.size.width/2.0
            let centerY = self.origin.y + self.size.height/2.0
            return CGPoint(x: centerX, y: centerY)
        }
    }
    
    public var topLeftPoint:CGPoint{
        get{
            return self.origin
        }
    }
    
    public var topRightPoint:CGPoint{
        get{
            let rightX = self.origin.x + self.size.width
            return CGPoint(x: rightX, y: self.origin.y)
        }
    }
    
    public var bottomLeftPoint:CGPoint{
        get{
            let bottomY = self.origin.y + self.size.height
            return CGPoint(x: self.origin.x,y: bottomY)
        }
    }
    
    public var bottomRightPoint:CGPoint{
        get{
            let rightX = self.origin.x + self.size.width
            let bottomY = self.origin.y + self.size.height
            return CGPoint(x: rightX, y: bottomY)
        }
    }
    
    public func centerRectInsideRect(containerRect:CGRect)->CGRect{
        var newRect:CGRect = self
        newRect.origin.x = (containerRect.size.width - self.size.width)/2.0
        newRect.origin.y = (containerRect.size.height - self.size.height)/2.0
        return newRect
    }
    
}
