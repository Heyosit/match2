//
//  StartScreen.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class StartScreen: SKScene, ButtonNodeDelegate {
    
    override init() {
        super.init(size: Consts.Graphics.screenResolution)
        createSceneContent()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createSceneContent() {
        
        let titleLabel = TitleLabel()
        scene?.addChild(titleLabel)
        
        let playButton = PlayButton()
        playButton.delegate = self
        scene?.addChild(playButton)
        
        let highScoreLabel = HighScoreLabel()
        scene?.addChild(highScoreLabel)
        
    }
    
    func buttonNodeTapped(_ sender: ButtonNode) {
        if let name = sender.name {
            if name == Consts.Names.NodesNames.play {
                RootViewController.shared.skView.presentScene(GameScreen())
            }
        }
    }
}
