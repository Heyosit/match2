//
//  UserDefault.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    private struct Keys {
        
        // MARK: - Constants
        static let highScores = "highScores"
    }
    
    class var highScore: Int {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.highScores) as Int?
        return storedValue ?? 0
    }
    
    class func set(highScore: Int) {
        UserDefaults.standard.set(highScore, forKey: UserDefaults.Keys.highScores)
    }
}

