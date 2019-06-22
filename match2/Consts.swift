//
//  Consts.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import UIKit
import SpriteKit

enum Z {
    static let background: CGFloat = -1.0
    static let sprites: CGFloat = 10.0
    static let labels: CGFloat = 80.0
    static let HUD: CGFloat = 100.0
    static let buttons: CGFloat = 150.0
    static let buttonLabels: CGFloat = 151.0
}

enum Positions {
    
    static let board = Consts.Positions.screenMid
    static let blockSide = CGFloat(Consts.Sizes.block.width + Consts.Graphics.spacingWidth)
    static let startingBlock = CGPoint(x: 0 - Consts.Sizes.board.width / 2 + Consts.Graphics.spacingWidth / 2 + Consts.Graphics.outerSpace, y: 0 + (Consts.Sizes.board.height / 2 ) - Consts.Graphics.spacingWidth - Consts.Graphics.outerSpace)

    
    static let highScoreLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Positions.screenLowHalfHeight)
    static let playButton = Consts.Positions.screenMid
    static let gameOverLabel = Consts.Positions.screenMid
    static let scoreLabel = Consts.Positions.screenTopHalf

    static let retryButton = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Positions.screenLowHalfHeight)
    static let timerLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: 0 + Consts.Graphics.spacingHeight)
    static let backButton = CGPoint(x: Consts.Positions.screenTopLeft.x + Consts.Sizes.backButton.width / 2, y: Consts.Positions.screenTopLeft.y - Consts.Sizes.backButton.height / 2 )
    static let titleLabel = CGPoint(x: Consts.Positions.screenWidthMid, y: Consts.Graphics.screenHeight - Consts.Graphics.spacingHeight * 1.5)
    
}

let colors = [
    "blue",
    "orange",
    "yellow",
    "violet",
    "red",
    "green"
]

struct Consts {
    struct Graphics {
        static let screenBounds = UIScreen.main.bounds
        static let screenWidth = screenBounds.width
        static let screenHeight = screenBounds.height
        static let screenResolution = screenBounds.size
        //        static let scale = screenWidth / 1336
        static let size = screenBounds.size
        static let spacingHeight = screenHeight / 20
        static let spacingWidth : CGFloat = 5
        static let outerSpace : CGFloat = 20
    }
    struct Positions {
        static let screenWidthMid = Graphics.screenBounds.width / 2
        static let screenHeightMid = Graphics.screenBounds.height / 2
        static let screenTopHalfHeight = Graphics.screenBounds.height / 1.50
        static let screenLowHalfHeight = Graphics.screenBounds.height / 4
        static let screenRightHalfWidth = Graphics.screenBounds.width / 1.5
        static let screenLeftHalfWidth = Graphics.screenBounds.width / 4
        static let screenTopHalf = CGPoint(x: screenWidthMid, y: Graphics.screenHeight - Graphics.spacingHeight * 2)
        static let screenTopLeft = CGPoint(x: Graphics.spacingWidth, y: Consts.Graphics.screenHeight - Graphics.spacingHeight)
        static let screenMid = CGPoint(x: screenWidthMid, y: screenHeightMid)
        static let screenLowHalf = CGPoint(x: screenWidthMid, y:screenLowHalfHeight)
    }
    struct Sizes {
        static let board = CGSize(width: Consts.Graphics.screenWidth - (Consts.Graphics.outerSpace * 2) + Consts.Graphics.spacingWidth, height: Consts.Graphics.screenWidth - (Consts.Graphics.outerSpace * 2) + Consts.Graphics.spacingWidth * 2)
        static let block = CGSize(width: (Sizes.board.width / 8) - Consts.Graphics.spacingWidth , height: (Sizes.board.width / 8) - Consts.Graphics.spacingWidth)
        
        static let playButton = CGSize(width: Graphics.screenWidth / 4 , height: Graphics.screenWidth / 4)
        static let backButton = CGSize(width: Graphics.screenWidth / 6 , height: Graphics.screenWidth / 6)
        
    }
    struct InitialSettings {
        static let score: Int = 0
        static let timeToRespond : TimeInterval = 120
    }
    struct Names {
        struct LabelNames {
            static let score = "ScoreLabel"
            static let gameOver = "GameOverLabel"
            static let retry = "RetryLabel"
            static let timer = "TimerLabel"
            static let highScore = "HighScore"
            static let title = "Title"
            
        }
        struct NodesNames {
            static let hud = "HUDNode"
            static let retry = "RetryButton"
            static let back = "BackButton"
            static let play = "PlayButton"
        }
        struct ButtonImageNames {
            static let back = "Back Button"
            static let play = "Play Button"
            static let retry = "Retry Button"
        }
        struct SceneNames {
            static let gameScreen = "GameScreen"
            static let startScreen = "StartScreen"
        }
        struct UserDefaultsNames {
            static let highScore = "HighScore"
        }
        struct ButtonStateNames {
            static let normal = " normal"
            static let highlighted = " highlighted"
            static let disabled = " disabled"
        }
        
    }
    struct Texts {
        static let score = "0"
        static let gameOver = "Game Over"
        static let retry = "Retry"
        static let timer = "3"
        static let highScore = "HS: "
        static let title = "Demo Match 2"
    }
        
}



