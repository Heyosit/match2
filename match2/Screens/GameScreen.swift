//
//  GameScreen.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class GameScreen: BaseScreen {
    
    var gameBoard = GameBoard.shared
    var hud = HUD.shared
    var lastUpdateTime: TimeInterval = 0
    var dt : TimeInterval = 0

    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createSceneContents() {
        super.createSceneContents()
//        self.view?.ignoresSiblingOrder = true
        hud.initializeGame()
        gameManager.isGameStarted = true
        self.addChild(gameBoard)
        self.addChild(hud)
    }
    
    public func gameOver() {
        
        gameManager.gameOver()
//        hud.gameOver()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // If we don't have a last frame time value, this is the first frame, so delta time will be zero.
        if lastUpdateTime <= 0 { lastUpdateTime = currentTime }
        gameBoard.update(currentTime: currentTime)
        dt = currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        
        
//        if !gameManager.isWaiting {return}
        if gameManager.isGameOver {
            gameOver()
            RootViewController.shared.skView.presentScene(GameOverScreen())

        }
        if !gameManager.isGameStarted {return}
        dt = (dt * 1000).rounded() / 1000
        hud.timeToRespondRemaining = -dt
    }
}
