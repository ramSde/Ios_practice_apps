//
//  TodoListViewViewModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import Foundation
import FirebaseFirestore

class TodoListViewViewModel : ObservableObject {
    
    
    @Published var showingnewItem = false
    
    func delete(id: String,userid: String){
        let db = Firestore.firestore()
        db.collection("users").document(userid).collection("todos").document(id).delete()
    }
}
