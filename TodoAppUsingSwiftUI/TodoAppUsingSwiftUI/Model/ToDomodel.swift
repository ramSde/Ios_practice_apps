//
//  ToDomodel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import Foundation


struct ToDo : Codable,Identifiable{
    let id: String
    let task : String
    let dueDate : TimeInterval
    let currentDate:TimeInterval
    var isdone : Bool
    
    mutating func setdone(_ state : Bool){
        isdone = state
    }
}
