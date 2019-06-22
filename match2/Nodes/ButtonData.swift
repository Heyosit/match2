//
//  ButtonData.swift
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
