//
//  ContentView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewmodel = MainViewModel()
    var body: some View {
      
        if(viewmodel.isSignedIn() &&  !viewmodel.currentUSerID.isEmpty){
            TabView{
                TodoListView(userID : viewmodel.currentUSerID)
                    .tabItem
                {
                    Label("home",systemImage: "house")
                }
                
                ProfileView()
                    .tabItem{
                        Label("Profile",systemImage: "person.circle")
                    }
            }
          
        }
        else {
            LoginView()
        }
           
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView()
    }
}
