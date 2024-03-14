//
//  LoginViewViewModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import Foundation
import FirebaseAuth
class LoginViewmodel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errormsg = ""
    
    func login() {
        if(validate()){
            Auth.auth().signIn(withEmail: email, password: password)
        }
        
    }
    private func validate() ->Bool{
        errormsg = ""
        if(email.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty){
            errormsg = "Fill All Details"
            return false
        }
         return true
        
    }
}
