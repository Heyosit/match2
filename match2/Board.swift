//
//  GameSquare.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

let gridManager = GridManager.shared

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
    
    func reset() {
        for child in children {
            if child.name?.contains("block") ?? false {
                let block = child as! BlockSprite
                block.setNextColor()
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GameBoard: SKNode {
    static let shared = GameBoard()
    
    var dataSource = DataSource()
    let board = Board()
    
    var numberOfBlockMatched = 0
    var hasJustMatched = false
    
    override init() {
        super.init()
        self.addChild(board)
    }

    func deleteBlocks() {
            if gridManager.goodBlocks.count >= 2 {
                hasJustMatched = true
                numberOfBlockMatched = gridManager.goodBlocks.count
                for goodBlock in gridManager.goodBlocks {
                    if let block = board.childNode(withName: "block\(goodBlock.row)\(goodBlock.col)") as! BlockSprite? {
                        block.matched = true
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
        if hasJustMatched && numberOfBlockMatched == 0 {
            gridManager.checkAtLeastOneMatchPossible()
            hasJustMatched = false
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
