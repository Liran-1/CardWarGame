//
//  Card.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import Foundation

struct Card {
    let value: Int
    let suit: Suit
    
    var imageName: String {
        return "\(value)_of_\(suit.rawValue)"
    }
}

enum Suit: String {
    case clubs, hearts, diamonds, spades
}
