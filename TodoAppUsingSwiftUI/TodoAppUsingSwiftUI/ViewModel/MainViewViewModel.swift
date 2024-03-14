//
//  MainViewViewModel.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 08/03/24.
//

import Foundation
import FirebaseAuth

class MainViewModel : ObservableObject {
 @Published var currentUSerID = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{
            [self] _, user in
            DispatchQueue.main.async {
                self.currentUSerID = user?.uid ?? ""
            }
        }
        
    }
    
    
    
    func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
}
