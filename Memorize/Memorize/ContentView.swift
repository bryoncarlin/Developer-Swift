//
//  ContentView.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["👽","😈","💀","💩","👻","😺","😾"]
    @State var emojiCount = 6
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    Cardview(content: emoji )
                    
                }
                
            }
            HStack {
                remove
                Spacer()
                add
                
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(.green)
    }
    var remove: some View{
        Button(action: {
            emojiCount -= 1
        }, label: {
            VStack{
                Text("Remove Card")
            }
        })
        
    }
    
    var add: some View{
        Button(action: {
            emojiCount += 1
        }, label: {
            VStack{
                Text("Add Card")
            }
        
        })
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
                    shape.stroke(lineWidth: 3)
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

