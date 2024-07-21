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
    }
    
    func declareWinner() {
        let winner = UserDefaults.standard.string(forKey: "winner")
        let score = UserDefaults.standard.string(forKey: "score")
        end_LBL_winner.text = "\(EndGameConstants.winner) \(winner ?? GameConstants.computerName)"
        end_LBL_score.text = "\(EndGameConstants.score) \(score ?? String(Int(-1)))"
    }
    
    
    @IBAction func end_BTN_backToMenu(_ sender: Any) {
    }
}
