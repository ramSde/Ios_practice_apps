//
//  ContentView.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
