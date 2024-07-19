//
//  Player.swift
//  CardWarGame
//
//  Created by Student20 on 19/07/2024.
//

import Foundation

class Player {
    var cards: [Card] = []
    var score: Int = 0
    
    func addCard(card: Card) {
        cards.append(card)
    }
    
}
