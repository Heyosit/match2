//
//  Labels.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class LabelData {
    var name: String
    var text: String
    var position: CGPoint?
    var zPosition: CGFloat
    var fontSize: CGFloat?
    var fontColor: UIColor?
    
    init(name: String, text: String, position: CGPoint?, zPosition: CGFloat, fontSize: CGFloat?, fontColor: UIColor?) {
        self.name = name
        self.text = text
        self.position = position
        self.zPosition = zPosition
        self.fontSize = fontSize
        self.fontColor = fontColor
    }
}

class SKLabelCustom: SKLabelNode {
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    func setup(labelData: LabelData) {
        self.text = labelData.text
        self.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        self.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        self.zPosition = labelData.zPosition
        if let positionNotNil = labelData.position {
            self.position = positionNotNil
        } else {
            self.position = CGPoint.zero
        }
        if let fontSizeNotNil = labelData.fontSize {
            self.fontSize = fontSizeNotNil
        }
        if let fontColorNotNil = labelData.fontColor {
            self.fontColor = fontColorNotNil
        }
        
    }
}

class HighScoreLabel: SKLabelCustom {
    
    var labelData = LabelData(name: Consts.Names.LabelNames.highScore, text: Consts.Texts.highScore + "\(UserDefaults.highScore)", position: Positions.highScoreLabel, zPosition: Z.labels, fontSize: 25, fontColor: nil)
    
    override init() {
        super.init()
        super.setup(labelData: labelData)
        name = labelData.text
        fontName = "SanFrancisco-Bold"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GameOverLabel: SKLabelCustom {
    
    var labelData = LabelData(name: Consts.Names.LabelNames.gameOver, text: Consts.Texts.gameOver, position: Positions.gameOverLabel, zPosition: Z.labels, fontSize: 70, fontColor: .red)
    
    override init() {
        super.init()
        super.setup(labelData: labelData)
        name = labelData.text
        fontName = "SanFrancisco-Bold"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ScoreLabel: SKLabelCustom {
    
    var labelData = LabelData(name: Consts.Names.LabelNames.score, text: Consts.Texts.score + "\(GameManager.shared.score)", position: Positions.scoreLabelInGameOver, zPosition: Z.labels, fontSize: 40, fontColor: nil)
    
    override init() {
        super.init()
        super.setup(labelData: labelData)
        name = labelData.text
        fontName = "SanFrancisco-Bold"

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
