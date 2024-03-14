//
//  RegisterView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct RegisterView: View {
 @StateObject   var viewmodel =  RegisterViewModel()
        var body: some View {
       
        VStack{
            HeaderViewLoginPage(rotationAngle: -15, smallText: "Start Organizing Things", mediumText: "Register", background: .orange)
       Spacer()
            
            Form{
                TextField("Enter your Full Name",text:  $viewmodel.fullname)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Enter Email",text: $viewmodel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                SecureField("Enter password",text:$viewmodel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                CustomLRButn(btncolor: .green, btnText: "Create Acount"){
                    viewmodel.register()
                }
                .padding()
               
            }
            .padding(.top,15)
            
        }
       
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
