//
//  ContentView.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["👽","😈","💀","💩","👻","😺","🐝",]
    @State var emojiCount = 7
    
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65)), ]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        Cardview(content: emoji ).aspectRatio(2/3, contentMode: .fit)
                    }
                    
                }
            }
            .foregroundColor(.green)
            Spacer()
            HStack {
                remove
                Spacer()
                add
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    var remove: some View{
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.square")
            
        }
        
    }
    
    var add: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.square")
            
            
        }
    }
}
struct Cardview: View{
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewDevice("iPhone 11")
    }
}

