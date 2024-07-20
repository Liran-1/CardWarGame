//
//  ViewController.swift
//  CardWarGame
//
//  Created by Student20 on 07/07/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PlayerEastCard: UIImageView!
    @IBOutlet weak var PlayerWestCard: UIImageView!
    @IBOutlet weak var PlayerEastScore: UILabel!
    @IBOutlet weak var PlayerWestScore: UILabel!
    
    
    let gameManager = GameManager()
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIStart()
        gameManager.dealCards()
        self.startGame()
        
        // Do any additional setup after loading the view.
    } // end func viewDidLoad
    
    func setUIStart() {
        PlayerEastCard.image = UIImage(named: "playing_card_back")
        PlayerWestCard.image = UIImage(named: "playing_card_back")
    }
    
    func startGame() {
        gameTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(playGameRound), userInfo: nil, repeats: true)
    } // end func startGame
    
    @objc func playGameRound() {
        let cardsPlayed = self.gameManager.playRound()
        self.showCards(cardsPlayed: cardsPlayed!)
    }
    
    func showCards(cardsPlayed: (cardEast: Card, cardWest: Card)) {
        let cardEastImage = cardsPlayed.cardEast.imageName
        let cardWestImage = cardsPlayed.cardWest.imageName
        PlayerEastCard.image = UIImage(named: cardEastImage)
        PlayerWestCard.image = UIImage(named: cardWestImage)
    } // end func showCards
    
    
    


} // end class ViewController

