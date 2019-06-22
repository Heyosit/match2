//
//  BaseScreen.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit


class BaseScreen: SKScene, ButtonNodeDelegate {
    
    var gameManager = GameManager.shared
    
    override init() {
        super.init(size: Consts.Graphics.size)
        createSceneContents()
    }
    
    func createSceneContents() {
        // MARK: BACK BUTTON
        let backButton = BackButton()
        backButton.delegate = self
        self.addChild(backButton)
    }
    
    func buttonNodeTapped(_ sender: ButtonNode) {
        if let name = sender.name {
            switch name {
            case Consts.Names.NodesNames.back:
                gameManager.resetGame()
                GameBoard.shared.resetBoard()
                RootViewController.shared.skView.presentScene(StartScreen())
            default:
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
