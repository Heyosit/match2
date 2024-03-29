//
//  Grid.swift
//  match2
//
//  Created by Alessio Perrotti on 18/06/2019.
//  Copyright © 2019 Alessio Perrotti. All rights reserved.
//

import Foundation

struct Block {
    var color: String = "clear"
    var position = (row: -1, col: -1)
    var checked = false
    mutating func setup(color: String) {
        self.color = color
    }
}

class GridPosition {
    var row: Int
    var col: Int
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
}

class GridManager {
    static let shared = GridManager()
    
    var Grid = Array(repeating: Array(repeating: Block(), count: 8), count: 8)
    var goodMatchBlocks: [GridPosition] = []
    
    
    func reset() {
        goodMatchBlocks.removeAll()
        for row in 0..<Grid.count {
            for col in 0..<Grid.count {
                Grid[row][col].checked = false
            }
        }
    }
    
    func printAllGrid(){
        for row in 0..<Grid.count {
            for col in 0..<Grid.count {
                debugPrint(Grid[row][col].color, Grid[row][col].checked, "| ", separator: " ", terminator: "")
            }
            debugPrint()
        }
    }
    
    func setGrid(color: String, position: GridPosition) {
        Grid[position.row][position.col].setup(color: color)
    }
    
    func floodFill(color: String, position: GridPosition) {
        
        if position.row >= Grid.count || position.col >= Grid.count || position.row < 0 || position.col < 0{
            return
        }
        if (Grid[position.row][position.col].checked) {
            return
        }
        if (Grid[position.row][position.col].color != color) {
            return
        } else {
            Grid[position.row][position.col].checked = true
        }
        goodMatchBlocks.append(position)
        
        var newPosition = GridPosition(row: position.row - 1, col: position.col)
        floodFill(color: color, position: newPosition)
        newPosition = GridPosition(row: position.row + 1, col: position.col)
        floodFill(color: color, position: newPosition)
        newPosition = GridPosition(row: position.row, col: position.col - 1)
        floodFill(color: color, position: newPosition)
        newPosition = GridPosition(row: position.row, col: position.col + 1)
        floodFill(color: color, position: newPosition)
        
    }
    
    func changeBlockColor(position: GridPosition, color: String) {
        Grid[position.row][position.col].setup(color: color)
    }
    
    func checkAtLeastOneMatchPossible() -> Bool {
        
        var canMatch = false
        var row = 0
        var col = 0
        while row < Grid.count && !canMatch  {
            while col < Grid.count && !canMatch  {
                // check the possible match only on even cell to halve the time of execution
                if (col + row) % 2 == 0 {
                    let gridPos = GridPosition(row: row, col: col)
                    canMatch = checkSides(color: Grid[row][col].color, position: gridPos)
                    if canMatch {
                        return true
                    }
                }
                col += 1
            }
            row += 1
            col = 0
        }
        return canMatch
    }
    
    private func checkSides(color: String, position: GridPosition) -> Bool{
        if isTheSameColor(color: color, position: GridPosition(row: position.row - 1, col: position.col)) {
            return true
        }
        if isTheSameColor(color: color, position: GridPosition(row: position.row + 1, col: position.col))  {
            return true
        }
        if isTheSameColor(color: color, position: GridPosition(row: position.row, col: position.col - 1))  {
            return true
        }
        if isTheSameColor(color: color, position: GridPosition(row: position.row, col: position.col + 1))  {
            return true
        }
        return false
        
    }
    
    private func isTheSameColor(color: String, position: GridPosition) -> Bool {
        if position.row >= Grid.count || position.col >= Grid.count || position.row < 0 || position.col < 0{
            return false
        }
        if (Grid[position.row][position.col].checked) {
            return false
        }
        if (Grid[position.row][position.col].color != color) {
            return false
        }
        return true
        
    }

}


