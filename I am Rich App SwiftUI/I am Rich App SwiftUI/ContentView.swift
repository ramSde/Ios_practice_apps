//
//  ContentView.swift
//  I am Rich App SwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            ZStack{
               
                Color(.red)
             
                
                VStack{
                    
                    Spacer(minLength: 400)
                    Text("Hello world").font(.system(size: 90)).fontWeight(.bold)
                    Image(systemName: "book")
                        .frame(height:200)
                        .foregroundColor(.accentColor).padding(30)
                    Text("Hello, world!")
                    
                }
                
                
            }
        }
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
