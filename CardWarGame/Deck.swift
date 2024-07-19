//
//  Deck.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import Foundation

class Deck {
    private var cards: [Card] = []
    
    init() {
        for suit in [Suit.clubs, Suit.hearts, Suit.diamonds, Suit.spades] {
            for value in 1..<11 {
                cards.append(Card(value: value, suit: suit))
            }
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func dealCard() -> Card? {
        return cards.popLast()
    }
    
    func compareCard(card1: Card, card2: Card) -> Int {
        if(card1.value > card2.value) {
            return 1
        } else if ( card1.value < card2.value) {
            return -1
        }
        else{
            return 0
        }
    }
    
    
//    func dealCards(numCards: Int) -> [Card] {
//        var dealtCards = [Card]()
//        for _ in 0..<numCards {
//            if let card = dealCard(){
//                dealtCards.add(card)
//            }
//            dealtCards.append(cards.removeLast())
//        }
//        return dealtCards
//    }
    
}
