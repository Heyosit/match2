//
//  Buttons.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class ButtonData {
    var highlightedTexture: String {
        get {
            return texture + Consts.Names.ButtonStateNames.highlighted
        }
    }
    var normalTexture: String {
        get {
            return texture + Consts.Names.ButtonStateNames.normal
        }
    }
    var disabledTexture: String {
        get {
            return texture + Consts.Names.ButtonStateNames.disabled
        }
    }
    var texture: String
    var name: String
    var size: CGSize
    var position: CGPoint
    var zPosition: CGFloat
    
    init(texture: String, name: String, size: CGSize, position: CGPoint, zPosition: CGFloat) {
        self.texture = texture
        self.name = name
        self.size = size
        self.position = position
        self.zPosition = zPosition
    }
}

class PlayButton: ButtonNode {
    
    let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.play, name: Consts.Names.NodesNames.play, size: Sizes.playButton, position: Positions.playButton, zPosition: Z.buttons)
    
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
    
    let buttonData = ButtonData(texture: Consts.Names.ButtonImageNames.back, name: Consts.Names.NodesNames.back, size: Sizes.backButton, position: Positions.backButton, zPosition: Z.buttons)
    
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

