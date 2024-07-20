//
//  ViewController.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var game_IMG_playerEastCard: UIImageView!
    @IBOutlet weak var game_IMG_playerWestCard: UIImageView!
    @IBOutlet weak var game_LBL_playerEastScore: UILabel!
    @IBOutlet weak var game_LBL_playerWestScore: UILabel!
    
    let gameManager = GameManager()
    var gameTimer: Timer?
    
    var playerEastScore: Int = 0
    var playerWestScore: Int = 0
    var roundsCounter: Int = 0
    var timerCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIStart()
        gameManager.dealCards()
        self.startGame()
    } // end func viewDidLoad
    
    func setUIStart() {
        game_IMG_playerEastCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        game_IMG_playerWestCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
    }
    
    func startGame() {
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playGameRound), userInfo: nil, repeats: true)
    } // end func startGame
    
    @objc func playGameRound() {
        if(roundsCounter == GameConstants.roundsToPlay) {
            gameTimer?.invalidate()
            finishGame()
        }
        timerCounter += 1
        if(timerCounter == GameConstants.timerFrontCard){
            let cardsPlayed = self.gameManager.playRound()
            self.showCards(cardsPlayed: cardsPlayed!)
            self.updateScore(cardsPlayed: cardsPlayed!)
        } else if ( timerCounter == GameConstants.roundTime) {
            self.hideCards()
            timerCounter = 0
            roundsCounter += 1
        }
    }
    
    func showCards(cardsPlayed: (cardEast: Card, cardWest: Card)) {
        let cardEastImage = cardsPlayed.cardEast.imageName
        let cardWestImage = cardsPlayed.cardWest.imageName
        game_IMG_playerEastCard.image = UIImage(named: cardEastImage)
        game_IMG_playerWestCard.image = UIImage(named: cardWestImage)
    } // end func showCards
    
    func updateScore(cardsPlayed: (cardEast: Card, cardWest: Card)) {
        
        var roundResult = cardsPlayed.cardEast.compareCards(otherCard: cardsPlayed.cardWest)
        if(roundResult == GameConstants.selfCard) {
            playerEastScore += 1
            game_LBL_playerEastScore.text = String(playerEastScore)
        } else if (roundResult == GameConstants.otherCard) {
            playerWestScore += 1
            game_LBL_playerWestScore.text = String(playerWestScore)
        }
    }
    
    func hideCards() {
        game_IMG_playerEastCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        game_IMG_playerWestCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
    }
    
    func finishGame() {
        
    }


} // end class ViewController

