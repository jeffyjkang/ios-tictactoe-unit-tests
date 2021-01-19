//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Jeff Kang on 1/18/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    // Horizontal 1 - 3
    
    func testWinHorizontal1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 0))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    func testWinHorizontal2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    func testWinHorizontal3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    // Vertical 1 - 3
    
    func testWinCheckingVertical1() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    func testWinCheckingVertical2() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    func testWinCheckingVertical3() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    
    // Diagonal rtl, ltr
    
    func testWinCheckingDiagonalrtl() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    func testWinCheckingDiagonalltr() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    // Incomplete game
    
    func testIncompleteGame() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (2, 2))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
    
    // Cats game
    
    func testCatsGame() {
        var board = GameBoard()
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (2, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 1))
        try! board.place(mark: .o, on: (2, 2))
        try! board.place(mark: .x, on: (1, 2))
        XCTAssertTrue(board.isFull)
        XCTAssertFalse(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
}
