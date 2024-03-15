//
//  ProfileView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.blue)
                    .frame(width: 125, height: 125)
                    .padding()
                // Info: Name, Email, Member since
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: ")
                        Text(viewmodel.user?.name ?? "")
                    }
                    .padding()
                    HStack {
                        Text("Email: ")
                        Text(viewmodel.user?.email ?? "")
                    }
                    .padding()
                    
                    
                    
                }
                Button("Log out"){
                    viewmodel.logOut()
                }
                .padding()
                Spacer()
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewmodel.fetchUser()
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
