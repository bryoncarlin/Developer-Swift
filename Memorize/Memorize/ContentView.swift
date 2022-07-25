//
//  ContentView.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
             RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3)
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
             Text("Hello, world!")
                .foregroundColor(.purple)
                
            
        }
        .padding(.horizontal)

                  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
