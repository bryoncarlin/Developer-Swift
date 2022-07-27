//
//  ContentView.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/25/22.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: CardView
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    Cardview(card: card )
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture{
                            viewModel.choose(card)
                        }
                }
                
            }
        }
        .foregroundColor(.green)
        .padding(.horizontal)
    }
    
}

struct Cardview: View{
    let card: CardGame<String>.Card
    
    var body: some View{
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else{
                shape.fill()
            }
            
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        let game = CardView()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 mini")
            .previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .previewDevice("iPhone 11")
    }
}

