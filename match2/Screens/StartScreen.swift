//
//  StartScreen.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class StartScreen: SKScene, ButtonNodeDelegate {
    
    let titleLabel: SKLabelNode = {
        let tl = SKLabelNode(text: Consts.Texts.title)
        tl.name = Consts.Names.LabelNames.title
        tl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tl.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        tl.zPosition = Z.labels
        tl.position = Positions.titleLabel
        tl.fontSize = 40
        return tl
    }()
    
    let highScoreLabel: SKLabelNode = {
        let hsl = SKLabelNode(text: Consts.Texts.highScore + "\(UserDefaults.highScore)")
        hsl.name = Consts.Names.LabelNames.highScore
        hsl.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        hsl.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        hsl.zPosition = Z.labels
        hsl.position = Positions.highScoreLabel
        hsl.fontSize = 25
        return hsl
    }()
    
    
    override init() {
        super.init(size: Consts.Screen.screenResolution)
        createSceneContent()
    }
    
    override func didMove(to view: SKView) {
        highScoreLabel.text = Consts.Texts.highScore + "\(UserDefaults.highScore)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createSceneContent() {
        
        let playButton = PlayButton()
        playButton.delegate = self
        scene?.addChild(playButton)
        
        scene?.addChild(titleLabel)
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
