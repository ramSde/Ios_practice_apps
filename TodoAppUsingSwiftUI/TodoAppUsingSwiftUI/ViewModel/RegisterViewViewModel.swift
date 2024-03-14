//
//  RegisterViewViewModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var errormsg = ""
    
    func register() {
        if(validate()){
            Auth.auth().createUser(withEmail: email, password: password){ result,error  in
                if let userid = result?.user.uid {
                    self.insertUserRecord(id: userid)
                }
                
            }
        }
        
    }
    
    func insertUserRecord(id : String){
        let newuser = User(id: id, name: fullname, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(["name": newuser.name,"email": newuser.email, "id":newuser.id,"joined": newuser.joined])
        
    }
    private func validate() ->Bool{
        errormsg = ""
        if(email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty ||  fullname.trimmingCharacters(in: .whitespaces).isEmpty ){
            errormsg = "Fill All Details"
            return false
        }
         return true
        
    }
}
