//
//  Buttons.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class PlayButton: ButtonNode {
    
    let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.play, name: Consts.Names.NodesNames.play, size: Consts.Sizes.squareButton, position: Positions.playButton, zPosition: Z.buttons)
    
    convenience init() {
        self.init(imageNamed: Consts.Names.ButtonImageNames.play, for: .normal)
        super.setup(buttonData: buttonData)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BackButton: ButtonNode {
    
    let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.back, name: Consts.Names.NodesNames.back, size: Consts.Sizes.squareButton, position: Positions.backButton, zPosition: Z.buttons)
    
    convenience init() {
        self.init(imageNamed: Consts.Names.ButtonImageNames.back, for: .normal)
        super.setup(buttonData: buttonData)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

