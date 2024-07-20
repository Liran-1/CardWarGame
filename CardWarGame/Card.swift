//
//  Card.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import Foundation

protocol CardComparator {
    func compareCards(otherCard: Card) -> String
}

struct Card: CardComparator{
    let value: Int
    let suit: Suit
    
    var imageName: String {
        return "\(value)_of_\(suit.rawValue)"
    }
    
    func compareCards(otherCard: Card) -> String {
        if(self.value > otherCard.value) {
            return GameConstants.selfCard
        } else if ( self.value < otherCard.value) {
            return GameConstants.otherCard
        } else{
            return ""
        }
    }
}

enum Suit: String {
    case clubs, hearts, diamonds, spades
}

