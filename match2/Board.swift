//
//  Board.swift
//  match2
//
//  Created by Alessio Perrotti on 19/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import SpriteKit

class Board: SKSpriteNode {
    
    public let board: SKSpriteNode = {
        let board = SKSpriteNode(color: UIColor.red, size: Consts.Sizes.board)
        board.position = Positions.board
        return board
    }()
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(color: UIColor.red, size: Consts.Sizes.board)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
