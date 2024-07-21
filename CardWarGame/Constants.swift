//
//  Constants.swift
//  CardWarGame
//
//  Created by Student20 on 20/07/2024.
//

import Foundation

enum GameConstants {
    static let roundsToPlay = 10
    static let timerFrontCard = 2
    static let timerBackCard = 3
    static let roundTime = timerFrontCard + timerBackCard
    static let selfCard = "selfCard"
    static let otherCard = "otherCard"
    static let animateLeftStr = "left"
    static let animateRightStr = "right"
}

enum CardConstants {
    static let cardImageBackgroundName = "playing_card_back"
}

enum WelcomeConstants {
    static let enterYourName = "Enter Your Name"
    static let welcome = "Welcome "
}
