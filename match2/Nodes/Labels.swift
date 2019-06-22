//
//  Labels.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class SKLabelCustom: SKLabelNode {
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
    func setup(labelData: LabelData) {
        //        let accData = AccessData(name: labelData.name, value: labelData.text, trait: UIAccessibilityTraits.none)
        //        let accLabel = accessib.shared.setupAccessibility(data: accData)
        self.text = labelData.text
        //        self.addChild(accLabel)
        
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
    
    
    
    func setText(text:String) {
        self.text = text
    }
}

class TitleLabel: SKLabelCustom {
    
    var labelData = LabelData(name: Consts.Names.LabelNames.title, text: Consts.Texts.title, position: Positions.titleLabel, zPosition: Z.labels, fontSize: 40, fontColor: nil)
    
    override init() {
        super.init()
        super.setup(labelData: labelData)
        name = labelData.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class HighScoreLabel: SKLabelCustom {
    
    var labelData = LabelData(name: Consts.Names.LabelNames.highScore, text: Consts.Texts.highScore + "\(UserDefaults.highScore)", position: Positions.highScoreLabel, zPosition: Z.labels, fontSize: 25, fontColor: nil)
    
    override init() {
        super.init()
        super.setup(labelData: labelData)
        name = labelData.text
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
