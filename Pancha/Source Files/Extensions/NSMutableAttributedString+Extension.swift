//
//  NSMutableAttributedString+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/29/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation
import UIKit

public extension NSMutableAttributedString{
    
    /*
     
     https://invasivecode.com/weblog/attributed-text-swift/
     http://soulwithmobiletechnology.blogspot.com/2012/07/how-to-use-nsattributedstring-in-ios-6.html
     https://github.com/alexfish/stylize
     
     NSTextEffectAttributeName
     NSAttachmentAttributeName
     NSBaselineOffsetAttributeName
     NSObliquenessAttributeName
     NSExpansionAttributeName
     NSWritingDirectionAttributeName
     NSVerticalGlyphFormAttributeName
     
     */
    
    
    public func setSystemFontWithSize(size:CGFloat){
        self.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: size), range: self.string.range)
    }
    
    public func setSystemFontWithSize(size:CGFloat,range:NSRange){
        self.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: size), range: range)
    }
    
    public func setFont(name:String, size:CGFloat){
        let font:UIFont? = UIFont(name: name, size: size)
        if font != nil {
            self.addAttribute(NSFontAttributeName, value: font!, range: self.string.range)
        }
    }
    
    public func setFont(name:String, size:CGFloat, range:NSRange){
        let font:UIFont? = UIFont(name: name, size: size)
        if font != nil {
            self.addAttribute(NSFontAttributeName, value: font!, range: range)
        }
    }
    
    public func setUnderlineStyle(style:NSUnderlineStyle){
        //NSUnderlineStyle.StyleSingle.rawValue
        self.addAttribute(NSUnderlineStyleAttributeName, value: style.rawValue, range: self.string.range)
    }
    
    public func setUnderlineStyle(style:NSUnderlineStyle, range:NSRange){
        //NSUnderlineStyle.StyleSingle.rawValue
        self.addAttribute(NSUnderlineStyleAttributeName, value: style.rawValue, range: range)
    }
    
    public func setUnderlineColour(colour:UIColor){
        self.addAttribute(NSUnderlineColorAttributeName, value: colour, range: self.string.range)
    }
    
    public func setUnderlineColour(colour:UIColor, range:NSRange){
        self.addAttribute(NSUnderlineColorAttributeName, value: colour, range: range)
    }
    
    //you can do more with NSParagraphStyle
    public func setParagraphStyle(paragraphStyle:NSParagraphStyle){
        self.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: self.string.range)
    }
    
    //you can do more with NSParagraphStyle
    public func setParagraphStyle(paragraphStyle:NSParagraphStyle, range:NSRange){
        self.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
    }
    
    public func setForgroundColour(colour:UIColor){
        self.addAttribute(NSForegroundColorAttributeName, value: colour, range: self.string.range)
    }
    
    public func setForgroundColour(colour:UIColor, range:NSRange){
        self.addAttribute(NSForegroundColorAttributeName, value: colour, range: range)
    }
    
    public func setBackgroundColour(colour:UIColor){
        self.addAttribute(NSBackgroundColorAttributeName, value: colour, range: self.string.range)
    }
    
    public func setBackgroundColour(colour:UIColor, range:NSRange){
        self.addAttribute(NSBackgroundColorAttributeName, value: colour, range: range)
    }
    
    public func setStrokeColour(colour:UIColor, width:Double){
        self.addAttribute(NSStrokeColorAttributeName, value: colour, range: self.string.range)
    }
    
    public func setStrokeColour(colour:UIColor, width:Double, range:NSRange){
        self.addAttribute(NSStrokeColorAttributeName, value: colour, range: range)
    }
    
    public func setStrokeWidth(colour:UIColor, width:Double){
        self.addAttribute(NSStrokeWidthAttributeName, value: colour, range: self.string.range)
    }
    
    public func setStrokeWidth(colour:UIColor, width:Double, range:NSRange){
        self.addAttribute(NSStrokeWidthAttributeName, value: colour, range: range)
    }
    
    public func setLink(url:NSURL){
        self.addAttribute(NSLinkAttributeName, value: url, range: self.string.range)
    }
    
    public func setLink(url:NSURL, range:NSRange){
        self.addAttribute(NSLinkAttributeName, value: url, range: range)
    }
    
    //බැඳි අකුරු
    public func setLigature(enable:Bool){
        self.addAttribute(NSLigatureAttributeName, value: enable, range: self.string.range)
    }
    
    public func setLigature(enable:Bool, range:NSRange){
        self.addAttribute(NSLigatureAttributeName, value: enable, range:range)
    }
    
    //space between characters (0-disabled to 10.0)
    public func setKern(amount:CGFloat){
        self.addAttribute(NSKernAttributeName, value: amount, range: self.string.range)
    }
    
    public func setKern(amount:CGFloat, range:NSRange){
        self.addAttribute(NSKernAttributeName, value: amount, range: range)
    }
    
    public func setStrikethroughStyle(amount:CGFloat){
        self.addAttribute(NSStrikethroughStyleAttributeName, value: amount, range: self.string.range)
    }
    
    public func setStrikethroughStyle(amount:CGFloat, range:NSRange){
        self.addAttribute(NSStrikethroughStyleAttributeName, value: amount, range: range)
    }
    
    public func setStrikethroughColour(colour:UIColor){
        self.addAttribute(NSStrikethroughColorAttributeName, value: colour, range: self.string.range)
    }
    
    public func setStrikethroughColour(colour:UIColor, range:NSRange){
        self.addAttribute(NSStrikethroughColorAttributeName, value: colour, range: range)
    }
    
    public func setShadow(offset:CGSize,blurRadius:CGFloat, colour:UIColor?, alpha:CGFloat){
        
        let shadow = NSShadow()
        shadow.shadowOffset = offset
        shadow.shadowBlurRadius = blurRadius
        
        if colour != nil {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            colour!.getRed(&r, green: &g, blue: &b, alpha: &a)
            let colourWithAlpha = UIColor(red: r, green: g, blue: b, alpha: alpha)
            
            shadow.shadowColor = colourWithAlpha
            
            self.addAttribute(NSShadowAttributeName, value: shadow, range: self.string.range)
        }else{
            self.addAttribute(NSShadowAttributeName, value: shadow, range: self.string.range)
        }
        
    }
    
    public func setShadow(offset:CGSize,blurRadius:CGFloat, colour:UIColor?, alpha:CGFloat, range:NSRange){
        
        let shadow = NSShadow()
        shadow.shadowOffset = offset
        shadow.shadowBlurRadius = blurRadius
        
        if colour != nil {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            colour!.getRed(&r, green: &g, blue: &b, alpha: &a)
            let colourWithAlpha = UIColor(red: r, green: g, blue: b, alpha: alpha)
            
            shadow.shadowColor = colourWithAlpha
            
            self.addAttribute(NSShadowAttributeName, value: shadow, range: range)
        }else{
            self.addAttribute(NSShadowAttributeName, value: shadow, range: range)
        }
        
    }
    
    public func setShadow(shadow:NSShadow){
        self.addAttribute(NSShadowAttributeName, value: shadow, range: self.string.range)
    }
    
    public func setShadow(shadow:NSShadow, range:NSRange){
        self.addAttribute(NSShadowAttributeName, value: shadow, range: range)
    }
    
}
