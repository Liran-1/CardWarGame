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
    
    @IBOutlet weak var game_LBL_playerEastName: UILabel!
    
    @IBOutlet weak var game_LBL_playerWestName: UILabel!
    
    let gameManager = GameManager()
    var gameTimer: Timer?
    
    var playerEastScore: Int = 0
    var playerWestScore: Int = 0
    var roundsCounter: Int = 0
    var timerCounter: Int = 0
    
    let animation:CATransition = CATransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUIStart()
        gameManager.dealCards()
        self.startGame()
    } // end func viewDidLoad
    
    func setUIStart() {
        self.game_IMG_playerEastCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        self.game_IMG_playerWestCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        
        let playerSide = loadFromUserDefaults(key: UserDefaultsConstants.playerSide)
        let playerName = loadFromUserDefaults(key: UserDefaultsConstants.userName)
        if (playerSide == GameConstants.eastSide){
            self.game_LBL_playerEastName.text = playerName
            self.game_LBL_playerWestName.text = GameConstants.computerName
        } else {
            self.game_LBL_playerEastName.text = GameConstants.computerName
            self.game_LBL_playerWestName.text = playerName
        }
    }
    
    func startGame() {
        self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(playGameRound), userInfo: nil, repeats: true)
    } // end func startGame
    
    @objc func playGameRound() {
        if(roundsCounter == GameConstants.roundsToPlay) {
            self.gameTimer?.invalidate()
            finishGame()
        }
        timerCounter += 1
        if(timerCounter == GameConstants.timerRevealCard){
            let cardsPlayed = self.gameManager.playRound()
            self.showCards(cardsPlayed: cardsPlayed!)
            self.updateScore(cardsPlayed: cardsPlayed!)
        } else if ( timerCounter == GameConstants.timerRoundTime) {
            self.hideCards()
            timerCounter = 0
            roundsCounter += 1
        }
    }
    
    func showCards(cardsPlayed: (cardEast: Card, cardWest: Card)) {
        let cardEastImage = cardsPlayed.cardEast.imageName
        let cardWestImage = cardsPlayed.cardWest.imageName
        
        let animationDuration: Double = 1
        
        game_IMG_playerEastCard.image = UIImage(named: cardEastImage)
        animateImageVIew(image: game_IMG_playerEastCard, duration: animationDuration, flipSide: GameConstants.animateRightStr)

        game_IMG_playerWestCard.image = UIImage(named: cardWestImage)
        animateImageVIew(image: game_IMG_playerWestCard, duration: animationDuration, flipSide: GameConstants.animateLeftStr)
    } // end func showCards
    
    func updateScore(cardsPlayed: (cardEast: Card, cardWest: Card)) {
        let roundResult = cardsPlayed.cardEast.compareCards(otherCard: cardsPlayed.cardWest)
        let animationDuration: Double = 1.25
        if(roundResult == GameConstants.selfCard) {
            self.playerEastScore += 1
            self.game_LBL_playerEastScore.text = String(playerEastScore)
            animateScorePush(label: game_LBL_playerEastScore, duration: animationDuration)
        } else if (roundResult == GameConstants.otherCard) {
            self.playerWestScore += 1
            self.game_LBL_playerWestScore.text = String(playerWestScore)
            animateScorePush(label: game_LBL_playerWestScore, duration: animationDuration)
        }
    } // end func updateScore
    
    func animateScorePush(label: UILabel, duration: Double) {
        self.animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.animation.type = CATransitionType.push
        self.animation.subtype = CATransitionSubtype.fromTop
        self.animation.duration = duration
        label.layer.add(animation, forKey: CATransitionType.push.rawValue)
    } // end func animateScorePush
    
    func hideCards() {
        let animationTime: Double = 1
        self.game_IMG_playerEastCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        animateImageVIew(image: game_IMG_playerEastCard, duration: animationTime, flipSide: GameConstants.animateLeftStr)
        self.game_IMG_playerWestCard.image = UIImage(named: CardConstants.cardImageBackgroundName)
        animateImageVIew(image: game_IMG_playerWestCard, duration: animationTime, flipSide: GameConstants.animateRightStr)
    }
    
    func animateImageVIew(image: UIView, duration: Double, flipSide: String) {
        var flipOption: UIView.AnimationOptions
        if(flipSide == GameConstants.animateLeftStr){
            flipOption = .transitionFlipFromLeft
        } else {
            flipOption = .transitionFlipFromRight
        }
        UIView.transition(with: image, duration: duration, options: flipOption, animations: nil, completion: nil)
    }
    
    func finishGame() {
        saveWinner()
        navigateToEndGameScreen()
    }
    
    func saveWinner() {
        var winnerScore:Int = -1
        var winnerName: String = GameConstants.computerName
        if playerEastScore > playerWestScore {
            winnerScore = playerEastScore
            winnerName = (game_LBL_playerEastName.text ?? GameConstants.computerName)
        } else if playerWestScore >= playerEastScore{
            winnerScore = playerWestScore
            winnerName = (game_LBL_playerWestName.text ?? GameConstants.computerName)
        }
        saveToUserDefaults(value: String(winnerScore), key: UserDefaultsConstants.winnerScore)
        saveToUserDefaults(value: winnerName, key: UserDefaultsConstants.winnerName)
    }
    
    func navigateToEndGameScreen() {
        print("navigating")
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        if let viewController = storyboard?.instantiateViewController(withIdentifier: "EndGameViewController") as? ViewController {
//            self.navigationController?.pushViewController(viewController, animated: true)
//        }
        performSegue(withIdentifier: "EndGameSegue", sender: nil)
    }
    
    func saveToUserDefaults(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func loadFromUserDefaults(key: String) -> String{
        if let loadedData = UserDefaults.standard.string(forKey: key) {
            return loadedData
        }
        return ""
    }

} // end class ViewController

