//
//  EndGameViewController.swift
//  CardWarGame
//
//  Created by Student20 on 21/07/2024.
//

import Foundation
import UIKit

class EndGameViewController: UIViewController {
    @IBOutlet weak var end_LBL_winner: UILabel!
    
    @IBOutlet weak var end_LBL_score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        declareWinner()
        saveToUserDefaults(value: String(-1), key: UserDefaultsConstants.winnerScore)
        saveToUserDefaults(value: "", key: UserDefaultsConstants.playerSide)
    }
    
    func declareWinner() {
        let winner: String = loadFromUserDefaults(key: UserDefaultsConstants.winnerName)//UserDefaults.standard.string(forKey: "winner")
        let score: String = loadFromUserDefaults(key: UserDefaultsConstants.winnerScore )//UserDefaults.standard.string(forKey: "score")
        end_LBL_winner.text = "\(EndGameConstants.winner) \(winner)"
        end_LBL_score.text = "\(EndGameConstants.score) \(score)"
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
    
    
    @IBAction func end_BTN_backToMenu(_ sender: Any) {
    }
}
