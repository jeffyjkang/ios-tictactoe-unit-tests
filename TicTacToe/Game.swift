//
//  Game.swift
//  TicTacToe
//
//  Created by Jeff Kang on 1/20/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else {
            NSLog("No active player")
            return
        }
//        do {
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                gameIsOver = true
                winningPlayer = activePlayer
            } else if board.isFull {
                gameIsOver = true
                winningPlayer = nil
            } else {
                self.activePlayer = activePlayer == .x ? .o : .x
            }
//        }
//        catch {
//            NSLog("Illegal move")
//        }
    }
    
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
    init() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
}
