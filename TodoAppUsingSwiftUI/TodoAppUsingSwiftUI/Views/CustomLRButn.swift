//
//  CustomLRButn.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 14/03/24.
//

import SwiftUI

struct CustomLRButn: View {
    let btncolor : Color
    let btnText : String
    let action : ()-> Void
    var body: some View {
        
        Button {
            action()
            
        }
        
        label :{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(btncolor)
                Text(btnText)
                    .foregroundColor(.white)
                    .bold()
                
            }
        }
    }
}

struct CustomLRButn_Previews: PreviewProvider {
    static var previews: some View {
        CustomLRButn(btncolor: .red, btnText: "helo"){
            
        }
    }
}
