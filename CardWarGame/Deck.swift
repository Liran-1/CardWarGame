//
//  Deck.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import Foundation

class Deck {
    var cards = [Card]()
    
    init() {
        for _ in 0..<30 {
            let value = Int.random(in: 1...10)
            let suit = ["Hearts", "Diamonds", "Clubs", "Spades"].randomElement()!
            cards.append(Card(value: value, suit: suit))
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func dealCards(numCards: Int) -> [Card] {
        var dealtCards = [Card]()
        for _ in 0..<numCards {
            dealtCards.append(cards.removeLast())
        }
        return dealtCards
    }
    
}
