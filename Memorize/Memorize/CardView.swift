//
//  CardView.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/26/22.
//

import SwiftUI

class CardView: ObservableObject {
    static let emojis = ["👽", "😈", "💀", "💩", "👻", "😺", "🐝", "🌶", "🦖", "🦄", "👨‍❤️‍💋‍👨", "🫃", "🫥", "🐁", "🐘", "⚾️", "🥃", "🥸", "🥺", "🐱"]
    static func createCardGame() -> CardGame<String> {
        CardGame<String>(numberOfPairs: 10) { pairIndex in
            CardView.emojis[pairIndex]
        }
    }
    
    @Published private var model: CardGame<String> = CardView.createCardGame()
    
    var cards: Array<CardGame<String>.Card>{
        return model.cards
    }
    //MARK: - Intet(s)
    func choose(_ card: CardGame<String>.Card) {
        model.choose(card)
    }
}

