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
    
    static let board = Consts.ScreenPositions.screenMid
    static let blockSide = CGFloat(Sizes.block.width + Consts.Screen.spacingWidth)
    static let startingBlock = CGPoint(x: 0 - Sizes.board.width / 2 + Consts.Screen.spacingWidth * 4,
                                       y: 0 + (Sizes.board.height / 2 ) - Consts.Screen.spacingWidth * 4)
    static let highScoreLabel = CGPoint(x: Consts.ScreenPositions.screenWidthMid, y: Consts.ScreenPositions.screenLowHalfHeight)
    static let playButton = Consts.ScreenPositions.screenMid
    static let gameOverLabel = Consts.ScreenPositions.screenMid
    static let scoreLabel = Consts.ScreenPositions.screenTop
    static let scoreLabelInGameOver = Consts.ScreenPositions.screenTopHalf
    static let retryButton = CGPoint(x: Consts.ScreenPositions.screenWidthMid, y: Consts.ScreenPositions.screenLowHalfHeight)
    static let timerLabel = CGPoint(x: Consts.ScreenPositions.screenWidthMid, y: 0 + Consts.Screen.spacingHeight)
    static let backButton = CGPoint(x: Consts.ScreenPositions.screenTopLeft.x + Sizes.backButton.width / 2, y: Consts.ScreenPositions.screenTopLeft.y - Sizes.backButton.height / 2 )
    static let titleLabel = CGPoint(x: Consts.ScreenPositions.screenWidthMid, y: Consts.Screen.screenHeight - Consts.Screen.spacingHeight * 1.5)
}

enum Sizes {
    static let board = CGSize(width: Consts.Screen.screenWidth - Consts.Screen.outerSpace  ,
                              height: Consts.Screen.screenWidth - Consts.Screen.outerSpace )
    static let block = CGSize(width: (Sizes.board.width / 8) - Consts.Screen.spacingWidth ,
                              height: (Sizes.board.width / 8) - Consts.Screen.spacingWidth)
    static let playButton = CGSize(width: Consts.Screen.screenWidth / 4 , height: Consts.Screen.screenWidth / 4)
    static let backButton = CGSize(width: Consts.Screen.screenWidth / 6 , height: Consts.Screen.screenWidth / 6)
    
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
    struct Screen {
        static let screenBounds = UIScreen.main.bounds
        static let screenWidth = screenBounds.width
        static let screenHeight = screenBounds.height
        static let screenResolution = screenBounds.size
        static let size = screenBounds.size
        static let spacingHeight = screenHeight / 20
        static let spacingWidth : CGFloat = 5
        static let outerSpace : CGFloat = 40
    }
    struct ScreenPositions {
        static let screenWidthMid = Screen.screenBounds.width / 2
        static let screenHeightMid = Screen.screenBounds.height / 2
        static let screenTopHalfHeight = Screen.screenBounds.height / 1.50
        static let screenLowHalfHeight = Screen.screenBounds.height / 4
        static let screenRightHalfWidth = Screen.screenBounds.width / 1.5
        static let screenLeftHalfWidth = Screen.screenBounds.width / 4
        static let screenTop = CGPoint(x: screenWidthMid, y: Screen.screenHeight - Screen.spacingHeight * 2)
        static let screenTopLeft = CGPoint(x: Screen.spacingWidth, y: Consts.Screen.screenHeight - Screen.spacingHeight)
        static let screenMid = CGPoint(x: screenWidthMid, y: screenHeightMid)
        static let screenLowHalf = CGPoint(x: screenWidthMid, y:screenLowHalfHeight)
        static let screenTopHalf = CGPoint(x: screenWidthMid, y: screenTop.y - screenLowHalfHeight)
    }
    
    struct InitialSettings {
        static let score: Int = 0
        static let timeToRespond : TimeInterval = 4
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
            static let block = "Block"
        }
        struct ButtonImageNames {
            static let back = "Back Button"
            static let play = "Play Button"
            static let retry = "Retry Button"
        }
        struct SceneNames {
            static let gameScreen = "GameScreen"
            static let startScreen = "StartScreen"
            static let gameOverScreen = "GameOverScreen"
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
        static let score = "Score: "
        static let gameOver = "Game Over"
        static let retry = "Retry"
        static let timer = "120"
        static let highScore = "HighScore: "
        static let title = "Demo Match 2"
    }
        
}



