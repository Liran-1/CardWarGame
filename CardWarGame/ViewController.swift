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
    
    let animation:CATransition = CATransition()
    
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
        UIView.transition(with: game_IMG_playerEastCard, duration: 1.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        game_IMG_playerWestCard.image = UIImage(named: cardWestImage)
        UIView.transition(with: game_IMG_playerWestCard, duration: 1.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    } // end func showCards
    
    func updateScore(cardsPlayed: (cardEast: Card, cardWest: Card)) {
        
        let roundResult = cardsPlayed.cardEast.compareCards(otherCard: cardsPlayed.cardWest)
        if(roundResult == GameConstants.selfCard) {
            self.playerEastScore += 1
            self.game_LBL_playerEastScore.text = String(playerEastScore)
            animateScore(label: game_LBL_playerEastScore)
        } else if (roundResult == GameConstants.otherCard) {
            self.playerWestScore += 1
            self.game_LBL_playerWestScore.text = String(playerWestScore)
            animateScore(label: game_LBL_playerWestScore)
        }
    }
    
    func animateScore(label: UILabel) {
        self.animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.animation.type = CATransitionType.push
        self.animation.subtype = CATransitionSubtype.fromTop
        self.animation.duration = 1.25
        label.layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
    
    func hideCards() {
        self.game_IMG_playerEastCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        UIView.transition(with: game_IMG_playerEastCard, duration: 1.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        self.game_IMG_playerWestCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        UIView.transition(with: game_IMG_playerWestCard, duration: 1.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    func finishGame() {
        
    }


} // end class ViewController

