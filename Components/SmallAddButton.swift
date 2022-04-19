//
//  SmallAddButton.swift
//  todo_app
//
//  Created by Ahmed Almohammed on 18/04/2022.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack{
            
            Circle()
                .foregroundColor(Color("button_color"))
                .frame(width:80, height: 80)
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
        }
        .frame(height: 50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
