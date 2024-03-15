//
//  addNewItemViewViewModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class addnewTodoViewModel : ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
  @Published var showalert = false
    func save() {
        if let userid = Auth.auth().currentUser?.uid {
            let db = Firestore.firestore()
            
            let newdata = ToDo(id: userid, task: title, dueDate: dueDate.timeIntervalSince1970, currentDate: Date().timeIntervalSince1970, isdone: false)
            let id = UUID().uuidString
            db.collection("users").document(userid).collection("todos").document(id).setData( ["id":id, "task":newdata.task , "dueDate": newdata.dueDate , "currentDate":newdata.currentDate,"isdone":newdata.isdone])
        }
        
    }
     func validate() ->Bool{
         showalert = false
        if(title.trimmingCharacters(in: .whitespaces).isEmpty || dueDate < Date().addingTimeInterval(-86400)){
           
            return false
        }
         return true
        
    }
    
}
