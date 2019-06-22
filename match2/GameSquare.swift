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
    var matched: Bool = false
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
        anchorPoint = CGPoint.zero
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
        //        gridManager.printAllGrid()
        GameBoard.shared.deleteBlocks()
        super.touchesEnded(touches, with: event)
        
        
    }
    
    func match(){
        if matched {
            setNextColor()
            matched = false
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
                        block.colorName = "clear"
                        block.texture = SKTexture(imageNamed: "white normal")
                        debugPrint(block)
                        block.match()
                        
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
