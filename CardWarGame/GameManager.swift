//
//  GameManager.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import Foundation

class GameManager {
    var deck = Deck()
    var playerEastCards = [Card]()
    var playerWestCards = [Card]()
    var playerEastScore = 0
    var playerWestScore = 0
    
    private var playerEast: Player
    private var playerWest: Player
    
    
    
    init() {
        deck = Deck()
        playerEast = Player()
        playerWest = Player()
    } // end func init
    
    func dealCards() {
        // Shuffle the deck
        deck.shuffle()
        
        // Deal cards to players
        for _ in 0..<10 {
            if let card = deck.dealCard() {
                playerEast.addCard(card: card)
            } // end if
            if let card = deck.dealCard() {
                playerWest.addCard(card: card)
            }   // end if
        } // end for
    } // end func dealCards
    
    func playRound() -> (cardEast: Card, cardWest: Card)? {
        guard let cardEast = playerEast.cards.popLast(),
              let cardWest = playerWest.cards.popLast() else {
            return nil
        } // end guard
                
        return (cardEast, cardWest)
        
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
    } // end func playRound
    
    func determineWinner() -> Int {
        var winner = 0
        if playerEastScore > playerEastScore{
            winner = 1
        } else if  playerEastScore >  playerEastScore {
            winner = 2
        } else{
            winner = 0
        }
        return winner
    } // end func determineWinner
}
