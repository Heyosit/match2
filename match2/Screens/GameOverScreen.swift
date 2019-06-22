//
//  GameOverScreen.swift
//  match2
//
//  Created by Alessio Perrotti on 22/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit


class GameOverScreen: BaseScreen {
    
    override init() {
        super.init()
        createSceneContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func createSceneContents() {
        super.createSceneContents()
        let highScoreLabel = HighScoreLabel()
        scene?.addChild(highScoreLabel)
        
        let gameOverLabel = GameOverLabel()
        scene?.addChild(gameOverLabel)

    }
}
