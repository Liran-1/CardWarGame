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
        cleanGameMemory()
    }
    
    func declareWinner() {
        let winner: String = loadFromUserDefaults(key: UserDefaultsConstants.winnerName) ?? GameConstants.computerName
        let score: String = loadFromUserDefaults(key: UserDefaultsConstants.winnerScore) ?? String(-1)
        end_LBL_winner.text = "\(EndGameConstants.winner) \(winner)"
        end_LBL_score.text = "\(EndGameConstants.score) \(score)"
    }
    
    func cleanGameMemory() {
        cleanUserDefaults(key: UserDefaultsConstants.winnerScore)
        cleanUserDefaults(key: UserDefaultsConstants.playerSide)
        cleanUserDefaults(key: UserDefaultsConstants.winnerName)
    }
    
    func saveToUserDefaults(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    func loadFromUserDefaults(key: String) -> String?{
        if let loadedData = UserDefaults.standard.string(forKey: key) {
            return loadedData
        }
        return nil
    }
    
    func cleanUserDefaults(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    
    @IBAction func end_BTN_backToMenu(_ sender: Any) {
    }
}
