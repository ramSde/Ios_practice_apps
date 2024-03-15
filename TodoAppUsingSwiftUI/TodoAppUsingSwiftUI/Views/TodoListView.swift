//
//  TodoListView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI
import FirebaseFirestore
struct TodoListView: View {
    @StateObject var viewmodel = TodoListViewViewModel()
    @FirestoreQuery   var items : [ToDo]
    let userID: String // Declare userID as a property
  
    init( userID: String){
        self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
    }
    
  
    var body: some View {
        NavigationView{
            VStack {
                if items.isEmpty {
                                  Text("Loading...") // Display a loading indicator while fetching data
                              } else {
                                  // Display your list of todos here using List or ForEach
                                  List(items) { todo in
                                    ToDOCustomCellView(item: todo)
                                          .swipeActions{
                                              Button {
                                                  viewmodel.delete(id: todo.id, userid: self.userID)
                                              }
                                           
                                              label : {
                                                  Text("Delete")
                                                  
                                              }
                                              .tint(.red)
                                          }
                                      
                                  }
                              }
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
        TodoListView(userID: "VN5FKgF56BeBrm1l7IQqBQpkSGg2")
    }
}
