//
//  Constants.swift
//  CardWarGame
//
//  Created by Student20 on 20/07/2024.
//

import Foundation

enum GameConstants {
    static let roundsToPlay = 1
    static let timerFrontCard = 2
    static let timerBackCard = 3
    static let roundTime = timerFrontCard + timerBackCard
    static let computerName = "PC"
    static let eastSide = "eastSide"
    static let westSide = "westSide"
    static let selfCard = "selfCard"
    static let otherCard = "otherCard"
    static let animateLeftStr = "left"
    static let animateRightStr = "right"
}

enum EndGameConstants {
    static let winner = "Winner:"
    static let score = "Score:"
}

enum CardConstants {
    static let cardImageBackgroundName = "playing_card_back"
}

enum WelcomeConstants {
    static let enterYourName = "Enter Your Name"
    static let welcome = "Welcome "
}

enum UserDefaultsConstants {
    static let userName = "userName"
    static let playerSide = "playerSide"
}

enum LocationConstants {
    static let east = "east"
    static let west = "west"
    static let sideLongitude = 34.81801612783521
}
