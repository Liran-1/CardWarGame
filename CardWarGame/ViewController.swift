//
//  ViewController.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Player1Card: UIImageView!
    @IBOutlet weak var Player2Card: UIImageView!
    @IBOutlet weak var Player1Scpre: UILabel!
    @IBOutlet weak var Player2Score: UILabel!
    
    let gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameManager.dealCards()
        self.startGame()
        
        // Do any additional setup after loading the view.
    }
    
    func startGame() {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true){ timer in
            let cardsPlayed = self.gameManager.playRound()
            self.showCards(cardsPlayed: cardsPlayed!)
            let roundResult = gameManager.Deck.compareCard(card1: cardsPlayed?.card1, card2: cardsPlayed?.card2)
        }
    }
    
    func showCards(cardsPlayed: (card1: Card, card2: Card)) {
        let card1Image = cardsPlayed.card1.imageName
        let card2Image = cardsPlayed.card2.imageName
        Player1Card.image = UIImage(named: card1Image)
        Player2Card.image = UIImage(named: card2Image)
    }
    
    
    


}

