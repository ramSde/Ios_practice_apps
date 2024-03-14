//
//  HeaderViewLoginPage.swift
//  TodoAppUsingSwiftUI
//
//  Created by Zignuts Tchnolab on 14/03/24.
//

import SwiftUI

struct HeaderViewLoginPage: View {
    let rotationAngle : Double
    let smallText : String
    let mediumText : String
    let background : Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(background)
                .rotationEffect(Angle(degrees: rotationAngle))
            
            VStack {
                Text(mediumText)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(.white)
                Text(smallText)
                    .font(.system(size: 30))
                    .bold()
                    .foregroundColor(.white)
            }
            
            .padding(.top , 30)
            
        }
        
        .frame(width: UIScreen.main.bounds.width*3,height: 350)
        .offset(y : -150)
        
       
    
    }
}

struct HeaderViewLoginPage_Previews: PreviewProvider {
    static var previews: some View {
        HeaderViewLoginPage(rotationAngle: 15, smallText: "title", mediumText: "big title", background: .pink)
    }
}
