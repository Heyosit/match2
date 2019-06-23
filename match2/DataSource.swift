//
//  DataSource.swift
//  match2
//
//  Created by Alessio Perrotti on 19/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import GameplayKit

struct DataSource {
    
    var linearRandomSource: GKLinearCongruentialRandomSource!
    var colorDice: GKRandomDistribution!
    
    init() {
        initializeDice()
    }
    
    mutating func initializeDice() {
        linearRandomSource = GKLinearCongruentialRandomSource()
        colorDice = GKRandomDistribution(randomSource: linearRandomSource, lowestValue: 0, highestValue: colors.count - 1 )
    }
    
    func nextColor() -> String {
        let nextColor = colorDice.nextInt()
        return colors[nextColor]
    }
    
    func getPoints(x: Int) -> Int {
        var pow: Double = (Double(x) - 2) / 5
        pow *= pow
        let points = (x - 1) * 80
        let total = Double(points) + pow
        return Int(total);
    }
    
    func getTime(x: Int) -> TimeInterval {
        var pow: Double = (Double(x) - 2) / 3
        pow *= pow
        // The original forumla add too much time, probably this one was the right one?
        let totalTime = 10 + (pow * 20)
        return TimeInterval(totalTime)
    }
}
