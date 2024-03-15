//
//  TodoListItemVirewModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 15/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListitemviewModel :ObservableObject {
    
    func toggle(item : ToDo){
        var itomcpy = item
        itomcpy.setdone(!item.isdone)
        
        if let uid = Auth.auth().currentUser?.uid {
            let db = Firestore.firestore()
            db.collection("users").document(uid).collection("todos").document(item.id).setData(["id":itomcpy.id,
                                                                                                "task":itomcpy.task,
                                                                                                "dueDate": itomcpy.dueDate,
                                                                                                "currentDate":itomcpy.currentDate,
                                                                                                "isdone": itomcpy.isdone
                                                                                               ])
        }
    }
}
