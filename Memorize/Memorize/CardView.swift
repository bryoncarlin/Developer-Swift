//
//  CardView.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/26/22.
//

import SwiftUI

class CardView {
    static let emojis = ["👽","😈","💀","💩","👻","😺","🐝","🌶","🦖","🦄","👨‍❤️‍💋‍👨","🫃","🫥","🐁","🐘","⚾️","🥃","🥸","🥺","🐱"]
    
    static func createCardGame() -> CardGame<String> {
        CardGame<String>(numberOfPairs: 4) { pairIndex in
            CardView.emojis[pairIndex]
        }
    }
    
    private var model: CardGame<String> = CardView.createCardGame()
    
    var cards: Array<CardGame<String>.Card>{
        return model.cards
    }
}
