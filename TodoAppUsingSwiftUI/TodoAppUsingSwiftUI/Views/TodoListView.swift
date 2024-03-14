//
//  TodoListView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewmodel = TodoListViewViewModel()
    let userID: String
    var body: some View {
        NavigationView{
            VStack {
                
            }
            .navigationTitle("ToDo List")
            .toolbar{
                Button{
                    viewmodel.showingnewItem = true
                }
                label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewmodel.showingnewItem){
                newItemAddView(newitempresented: $viewmodel.showingnewItem)
            }   
        }
     
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userID: "")
    }
}
