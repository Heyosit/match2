//
//  GameSquare.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

let gridManager = GridManager.shared


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
        guard state == .highlighted else { return }
        gridManager.floodFill(color: colorName, position: gridPosition)
        GameBoard.shared.deleteBlocks()
        super.touchesEnded(touches, with: event)
    }
    
    func match(){
        if matched {
            setNextColor()
            matched = false
        }
    }
    
    func hideBlock(){
        self.isHidden = true
        isAnimating = true
        endAnimationTime = currentTime + timeToAnimate
    }
    
    func update(currentTime: TimeInterval) {
//        debugPrint("updating block: ", self.gridPosition.row,self.gridPosition.col)

        self.currentTime = currentTime
        if !isAnimating { return }
        if currentTime > endAnimationTime {
            debugPrint("animating block: ", self.gridPosition.row,self.gridPosition.col)
            isAnimating = false
            self.match()
        }
    }
}

class Board: SKSpriteNode {
    
    var dataSource = DataSource()
    init() {
        super.init(texture: nil, color: UIColor.white, size: Consts.Sizes.board)
        createSceneContent()
    }
    
    func createSceneContent() {
        position = Positions.board
        for row in 0..<8 {
            for col in 0..<8 {
                let color = dataSource.nextColor()
                let position = GridPosition(row: row, col: col)
                let block = BlockSprite(position: position, color: color)
                gridManager.setGrid(color: color, position: position)
                addChild(block)
            }
        }
    }
    
    func update(currentTime: TimeInterval) {
//        debugPrint("updating Board")

        for child in children {
            if child.name?.contains("block") ?? false {
                let block = child as! BlockSprite
                block.update(currentTime: currentTime)
            }
        }
    }
    
    func reset() {
        for child in children {
            if child.name?.contains("block") ?? false {
                let block = child as! BlockSprite
                block.setNextColor()
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GameBoard: SKNode {
    static let shared = GameBoard()
    
    var dataSource = DataSource()
    let board = Board()
    
    override init() {
        super.init()
        self.addChild(board)
    }

    func deleteBlocks() {
            if gridManager.goodBlocks.count >= 2 {
                for goodBlock in gridManager.goodBlocks {
                    if let block = board.childNode(withName: "block\(goodBlock.row)\(goodBlock.col)") as! BlockSprite? {
                        debugPrint("blocco da cercare: ", goodBlock.row, goodBlock.col, " blocco trovato: ", block)
                        block.matched = true
                        debugPrint(block)
//                        block.match()
                        
                    }
                }
                HUD.shared.score = dataSource.getPoints(x: gridManager.goodBlocks.count)
                HUD.shared.timeToRespondRemaining = dataSource.getTime(x: gridManager.goodBlocks.count)
            }
            gridManager.reset()
    }
    
    func printGrid(){
        for row in 0..<8 {
            for col in 0..<8 {
                debugPrint("nome blocco: ","block\(row)\(col)")
                if let block = childNode(withName: "block\(row)\(col)") as! BlockSprite? {
                    debugPrint("block: ", block.colorName)
                }
            }
            
        }
    }
    
    func resetBoard() {
        board.reset()
    }
    
    func update(currentTime: TimeInterval) {
//        debugPrint("updating GameBoard")
        board.update(currentTime: currentTime)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
