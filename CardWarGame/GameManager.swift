//
//  GameManager.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import Foundation

class GameManager {
    var deck = Deck()
    var player1Cards = [Card]()
    var player2Cards = [Card]()
    var player1Score = 0
    var player2Score = 0
    
    private var player1: Player
    private var player2: Player
    
    init() {
        deck = Deck()
        player1 = Player()
        player2 = Player()
    }
    
    func dealCards() {
        // Shuffle the deck
        deck.shuffle()
        
        // Deal cards to players
        for _ in 0..<20 {
            if let card = deck.dealCard() {
                player1.addCard(card: card)
            }
            if let card = deck.dealCard() {
                player2.addCard(card: card)
            }
        }
        
    }
    
    func playRound() -> (card1: Card, card2: Card)? {
        guard let card1 = player1.cards.popLast(),
              let card2 = player2.cards.popLast() else {
            return nil
        }
                
        return (card1, card2)
        
//        player1Cards = deck.dealCards(numCards: 10)
//        player2Cards = deck.dealCards(numCards: 10)

//        var winner = 0
        //Start revealing cards with a timer
//        var currentCardIndex = 0
//        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: {
//            timer in guard currentCardIndex < 10 else {
//                timer.invalidate()
////                winner = self.determineWinner()
//                return
//            }
//            
//            // Show the current card
//            let card1 = self.player1Cards[currentCardIndex]
//            let card2 = self.player2Cards[currentCardIndex]
//            
//            if card1.value > card2.value {
//                self.player1Score += 1
//            } else if card2.value > card1.value {
//                self.player2Score += 1
//            }
//            currentCardIndex += 1
//        })
    }
    
    func determineWinner() -> Int {
        var winner = 0
        if player1Score > player1Score{
            winner = 1
        } else if  player1Score >  player1Score {
            winner = 2
        } else{
            winner = 0
        }
        return winner
    }
}
