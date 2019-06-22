//
//  HUD.swift
//  match2
//
//  Created by Alessio Perrotti on 22/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class HUD: SKNode {
    static let shared = HUD()
    
    let scoreLabel = SKLabelCustom(name: Consts.Names.LabelNames.score)
    let timerLabel = SKLabelCustom(name: Consts.Names.LabelNames.timer)
    var score: Int {
        get {
            return GameManager.shared.score
        }
        set {
            GameManager.shared.score += newValue
            scoreLabel.setText(text: "\(GameManager.shared.score)")
        }
    }
    var timeToRespondRemaining: TimeInterval {
        get {
            return GameManager.shared.timeToRespond
        }
        set {
            GameManager.shared.timeToRespond += newValue
            if GameManager.shared.timeToRespond < 0 {
                GameManager.shared.timeToRespond = 0
                GameManager.shared.isGameOver = true
            }
            let rounded = Int(GameManager.shared.timeToRespond)
            timerLabel.setText(text: "\(rounded)")
        }
    }
    
    override init() {
        super.init()
        self.name = Consts.Names.NodesNames.hud
        setup()
    }
    
    func setup() {
        
        initializeGame()
        let labelData = LabelData(name: timerLabel.name!, text: Consts.Texts.timer, position: Positions.timerLabel, zPosition: Z.HUD, fontSize: 60, fontColor: nil)
        timerLabel.setup(labelData: labelData)
        addChild(scoreLabel)
        addChild(timerLabel)
    }
    
    
    func initializeGame() {
        let labelData = LabelData(name: scoreLabel.name!, text: "0", position: Positions.scoreLabel, zPosition: Z.HUD, fontSize: 40, fontColor: nil)
        scoreLabel.setup(labelData: labelData)
    }
    
    func resetTimer() {
        timeToRespondRemaining = GameManager.shared.resetTimer()
    }
    
    func showTimer() {
        timerLabel.text = "\(GameManager.shared.timeToRespond)"
        timerLabel.isHidden = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

