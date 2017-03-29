//
//  Array+Extension.swift
//  Pancha
//
//  Created by Thilina Chamin Hewagama on 3/29/17.
//  Copyright © 2017 Pancha iOS. All rights reserved.
//

import Foundation

public extension Array{
    
    /*
     
     Using predicates
     
     var customerNameDict = ["firstName":"karthi","LastName":"alagu","MiddleName":"prabhu"];
     var clientNameDict = ["firstName":"Selva","LastName":"kumar","MiddleName":"m"];
     var employeeNameDict = ["firstName":"karthi","LastName":"prabhu","MiddleName":"kp"];
     var attributeValue = "karthi";
     
     var arrNames:Array = [];
     arrNames.append(customerNameDict);
     arrNames.append(clientNameDict);
     arrNames.append(employeeNameDict);
     
     var namePredicate =
     NSPredicate(format: "firstName like %@",attributeValue);
     
     let filteredArray = arrNames.filter { namePredicate.evaluateWithObject($0) };
     println("names = ,\(filteredArray)");
     
     
     */
    
    /*
     
     Filter Array
     
     Swift arrays have a .filter method that takes a closure -- this will do it:
     
     let filteredArray = arrayOfUsers.filter() { $0.userID == "1" }
     Closures can be simplified in a variety of ways. The full declaration of the closure would look more like this:
     
     var filteredArray = arrayOfUsers.filter( { (user: UserDetails) -> Bool in
     return user.userID == "1"
     })
     
     */
    
    public func isSubArray(array:Array)->Bool{
        
        return true
    }
    
}
