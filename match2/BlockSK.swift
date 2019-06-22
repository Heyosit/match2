//
//  BlockSK.swift
//  match2
//
//  Created by Alessio Perrotti on 22/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class BlockSprite: ButtonNode {
    var dataSource = DataSource()
    var isAnimating = false
    let timeToAnimate: TimeInterval = 0.3
    var currentTime: TimeInterval = 0
    var endAnimationTime: TimeInterval = 0
    var matched: Bool = false {
        didSet {
            if self.matched {
                hideBlock()
            }
            else {
                self.isHidden = false
            }
        }
    }
    var gridPosition = GridPosition(row: -1, col: -1)
    var colorName: String = "clear" {
        didSet {
            setTexture(imageNamed: self.colorName)
            gridManager.changeBlockColor(position: gridPosition, color: self.colorName)
        }
    }
    
    convenience init(position: GridPosition, color: String) {
        self.init(imageNamed: color, for: .normal)
        colorName = color
        setup(position: position)
    }
    func setup(position: GridPosition){
        size = Consts.Sizes.block
        name = "block\(position.row)\(position.col)"
        self.position = CGPoint(x: Positions.startingBlock.x + (Positions.blockSide * CGFloat(position.col)), y: Positions.startingBlock.y - (Positions.blockSide * CGFloat(position.row)))
        gridPosition = position
    }
    
    func setNextColor() {
        let newColor = dataSource.nextColor()
        colorName = newColor
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if GameManager.shared.isGameOver { state = .normal; return }
        if GameBoard.shared.hasJustMatched { return }
        guard state == .highlighted else { return }
        gridManager.floodFill(color: colorName, position: gridPosition)
        GameBoard.shared.deleteBlocks()
        super.touchesEnded(touches, with: event)
    }
    
    func match(){
        if matched {
            setNextColor()
            matched = false
            GameBoard.shared.numberOfBlockMatched -= 1
        }
    }
    
    func hideBlock(){
        self.isHidden = true
        isAnimating = true
        endAnimationTime = currentTime + timeToAnimate
    }
    
    func update(currentTime: TimeInterval) {
        self.currentTime = currentTime
        if !isAnimating { return }
        if currentTime > endAnimationTime {
            isAnimating = false
            self.match()
        }
    }
}
