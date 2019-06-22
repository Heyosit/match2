//
//  GameManager.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import Foundation

class GameManager {
    
    static let shared = GameManager()
    var score: Int = Consts.InitialSettings.score
    var timeToRespond: TimeInterval = Consts.InitialSettings.timeToRespond
    var isGameStarted = false
    var isGameOver = false
    var isWaiting = false
    
    
    
    func resetGame() {
        score = Consts.InitialSettings.score
        isGameStarted = false
        isGameOver = false
        isWaiting = false
        
        timeToRespond = Consts.InitialSettings.timeToRespond
    }
    
    func resetTimer() -> TimeInterval {
        timeToRespond = Consts.InitialSettings.timeToRespond
        return timeToRespond
    }
    
    
    func gameOver() {
        isGameStarted = false
        isGameOver = true
        isWaiting = false
        checkHighScore()
    }
    
    func checkHighScore() {
        if score > UserDefaults.highScore {
            UserDefaults.set(highScore: score)
        }
    }
    
    
    
}
