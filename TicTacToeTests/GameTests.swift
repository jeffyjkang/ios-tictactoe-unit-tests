//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Jeff Kang on 1/20/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    func testRestartCreatesEmptyBoard() {
        var game = Game()
        game.restart()
        for x in 0 ..< 3 {
            for y in 0 ..< 3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testRestartActivePlayer() {
        var game = Game()
        game.restart()
        XCTAssertEqual(game.activePlayer, .x)
    }
    
    func testRestartGameIsOver() {
        var game = Game()
        game.restart()
        XCTAssertFalse(game.gameIsOver)
    }
    
    func testRestartWinningPlayer() {
        var game = Game()
        game.restart()
        XCTAssertNil(game.winningPlayer)
    }
    
    func testMakeMarkAt00() {
        var game = Game()
        try! game.makeMark(at: (0, 0))
        XCTAssertEqual(game.board[(0, 0)], .x)
    }
    
    func testMakeMarkAt22() {
        var game = Game()
        game.activePlayer = .o
        try! game.makeMark(at: (2, 2))
        XCTAssertEqual(game.board[(2, 2)], .o)
    }
    
}
