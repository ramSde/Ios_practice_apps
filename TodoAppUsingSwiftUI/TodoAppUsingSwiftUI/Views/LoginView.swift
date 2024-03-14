//
//  LoginView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginViewmodel()
    var body: some View {
        
        NavigationView{
            
            VStack{
                HeaderViewLoginPage(rotationAngle: 15, smallText: "Get things Done", mediumText: "TODO LIST", background: .pink)
                
                
                Form{
                    if(!viewmodel.errormsg.isEmpty){
                        Text(viewmodel.errormsg)
                            .font(.system(size: 10))
                            .foregroundColor(.red)
                    }
                    TextField("Email Adress",text: $viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                            
                    
                    SecureField("enter password",text : $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    CustomLRButn(btncolor: .blue, btnText: "Log in"){
                        viewmodel.login()
                        
                    }
                    .padding()
                    
                    
                }
                .padding(10)
                
                
               
                
                VStack {
                    
                    Text(" New To Here")
                        .foregroundColor(.black)
                    NavigationLink("Create an Acount",destination : RegisterView())
                     
                  
                    .foregroundColor(.blue)
                    .padding(2)
                }
                .padding(.top ,5)
                
                
                
                
            }
            
            
        }
        
        
        }
    }


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
