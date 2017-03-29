//
//  UIImage+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/29/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    
    public func resizeToFit(frame: CGRect) -> UIImage {
        
        var length:CGFloat = 0
        
        if (frame.size.width < frame.size.height){
            length = frame.size.width
        }else{
            length = frame.size.height
        }
        
        var newSize = CGSize.zero
        
        if (self.size.width < self.size.height) {
            newSize.width = length * UIScreen.main.scale
            newSize.height = newSize.width * (self.size.height / self.size.width)
        }else{
            newSize.height = length * UIScreen.main.scale
            newSize.width = newSize.height * (self.size.width / self.size.height)
        }
        
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
}
