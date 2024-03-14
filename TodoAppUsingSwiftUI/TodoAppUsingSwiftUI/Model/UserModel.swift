//
//  UserModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 14/03/24.
//

import Foundation


struct User:Codable {
    
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
