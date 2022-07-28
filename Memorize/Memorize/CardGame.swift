//
//  CardGame.swift
//  Memorize
//
//  Created by Bryon Carlin on 7/26/22.
//

import Foundation

struct CardGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let MatchIndex = indexOfFaceUpCard{
                if cards[chosenIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[MatchIndex].isMatched = true
                }
                indexOfFaceUpCard = nil
            }else{
                for index in 0..<cards.count{
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairs: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //adds the pairs of cards * 2 to the array
        for pairIndex in 0..<numberOfPairs {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}

