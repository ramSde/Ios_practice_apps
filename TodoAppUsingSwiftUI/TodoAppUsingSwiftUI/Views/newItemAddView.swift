//
//  newItemAddView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct newItemAddView: View {
    @StateObject var viewmodel = addnewTodoViewModel()
    @Binding var newitempresented : Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            Form {
                TextField("title",text:$viewmodel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date",selection: $viewmodel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                CustomLRButn(btncolor: .yellow, btnText: "Save"){
                    if(viewmodel.validate()){
                        viewmodel.save()
                        newitempresented = false
                        
                    }
                    else {
                        viewmodel.showalert = true
                    }
                }
                .padding()
                
            }
            .alert (isPresented: $viewmodel.showalert){
                Alert(title: Text("Error"),message: Text("Please fill in all details and due date should be today or newer"))
            }
        }
    }
}

struct newItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        newItemAddView(newitempresented: Binding(get: {
            return true}, set:  { _ in 
            
        }))
    }
}
