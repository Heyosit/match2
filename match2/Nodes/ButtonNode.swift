//
//  ButtonNode.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

protocol ButtonNodeDelegate: class {
    func buttonNodeTapped(_ sender: ButtonNode)
}

enum ButtonState {
    case normal, highlighted, disabled
}

class ButtonNode: SKSpriteNode {
    weak var delegate: ButtonNodeDelegate?
    var normalImageName: String!
    var highlightedImageName: String!
//    var disabledImageName: String!
    var state = ButtonState.normal {
        willSet {
            switch newValue {
            case .normal:
                let texture = SKTexture(imageNamed: normalImageName)
                self.texture = texture
            case .highlighted:
                let texture = SKTexture(imageNamed: highlightedImageName)
                self.texture = texture
            case .disabled:
//                let texture = SKTexture(imageNamed: disabledImageName)
                self.texture = texture
            }
        }
    }
    
    convenience init(imageNamed: String, for _: ButtonState) {
        let texture = SKTexture(imageNamed: imageNamed + Consts.Names.ButtonStateNames.normal)
        self.init(texture: texture)
        self.normalImageName = imageNamed + Consts.Names.ButtonStateNames.normal
        self.highlightedImageName = imageNamed + Consts.Names.ButtonStateNames.highlighted
        self.isUserInteractionEnabled = true
    }
    
    func setup(buttonData: ButtonData) {
        highlightedImageName = buttonData.highlightedTexture
        self.name = buttonData.name
        self.size = buttonData.size
        self.position = buttonData.position
        self.zPosition = buttonData.zPosition
    }
    
    
//    func changeButtonDisabledState() {
//        state = state == .normal ? .disabled : .normal
//    }
    
    func setTexture(imageNamed: String) {
        normalImageName = imageNamed + Consts.Names.ButtonStateNames.normal
        highlightedImageName = imageNamed + Consts.Names.ButtonStateNames.highlighted
        self.texture = SKTexture(imageNamed: normalImageName)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if state == .disabled {return}
        state = .highlighted
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if state == .disabled {return}
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            let locationInParent = self.convert(touchLocation, to: self.parent!)
            let isTouchInside = self.contains(locationInParent)
            if isTouchInside {
                state = .highlighted
            } else {
                state = .normal
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if state == .disabled {return}
        guard state == .highlighted else { return }
        state = .normal
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        delegate?.buttonNodeTapped(self)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if state == .disabled {return}
        state = .normal
    }
}
