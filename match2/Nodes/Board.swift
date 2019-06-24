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
        super.init(texture: nil, color: UIColor.white, size: Sizes.board)
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
        //create a new board if no match is possible from the beginning
        while !gridManager.checkAtLeastOneMatchPossible() {
            reset()
        }
    }
    
    func reset() {
        for child in children {
            if child.name?.contains(Consts.Names.NodesNames.block) ?? false {
                let block = child as! BlockSprite
                block.setNextColor()
            }
        }
    }
    
    func update(currentTime: TimeInterval) {
        for child in children {
            if child.name?.contains(Consts.Names.NodesNames.block) ?? false {
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
    
    //when the number is back to zero all the blocks as been replaced
    var numberOfBlockMatched = 0
    var hasJustMatched = false
    
    override init() {
        super.init()
        self.addChild(board)
    }

    func deleteMatchedBlocks() {
        let matchedBlocks = gridManager.goodMatchBlocks
            if matchedBlocks.count >= 2 {
                hasJustMatched = true
                numberOfBlockMatched = matchedBlocks.count
                for matchedBlock in matchedBlocks {
                    if let block = board.childNode(withName: Consts.Names.NodesNames.block + "\(matchedBlock.row)\(matchedBlock.col)") as! BlockSprite? {
                        block.matched = true
                    }
                }
                HUD.shared.score = dataSource.getPoints(x: matchedBlocks.count)
                HUD.shared.timeToRespondRemaining = dataSource.getTime(x: matchedBlocks.count)
            }
            gridManager.reset()
    }
    
    func printGrid(){
        for row in 0..<8 {
            for col in 0..<8 {
                if let block = childNode(withName: Consts.Names.NodesNames.block +  "\(row)\(col)") as! BlockSprite? {
                    debugPrint("block: ", block.colorName)
                }
            }
        }
    }
    
    func resetBoard() {
        board.reset()
    }
    
    func update(currentTime: TimeInterval) {
        board.update(currentTime: currentTime)
        //after match and block replacement checks if other matches are possible
        if hasJustMatched && numberOfBlockMatched == 0 {
            if !gridManager.checkAtLeastOneMatchPossible() {
                GameManager.shared.gameOver()
            }
            hasJustMatched = false
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
