//
//  dataModelTodo.swift
//  Todoey
//
//  Created by Zignuts Tchnolab on 19/03/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct Todo: Codable {
    var task: String
    var isDone: Bool
}
