//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Jeff Kang on 1/21/21.
//  Copyright © 2021 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    private enum Mark: Equatable {
        case x
        case o
        case empty
        
        var stringValue: String {
            switch self {
            case .x: return "X"
            case .o: return "O"
            case .empty: return " "
            }
        }
    }
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }
    
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testWinCheckingVertical1() {
        /*
         0 1 2
         3 4 5
         6 7 8
         */
        
        /*
         X O -
         X O -
         X - -
         */
        
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button6 = buttonFor(6)
        
        button0.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button0.label, Mark.x.stringValue)
        
        button1.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button1.label, Mark.o.stringValue)
        
        button3.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button3.label, Mark.x.stringValue)
        
        button4.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        
        button6.tap()
        XCTAssertEqual(turnLabel.label, "Player X won!")
        XCTAssertEqual(button6.label, Mark.x.stringValue)
    }
    
    func testWinCheckingDiagonalRTL() {
        /*
         - - X
         O X O
         X - -
         */
        
        let button2 = buttonFor(2)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button5 = buttonFor(5)
        let button6 = buttonFor(6)
        
        button2.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button2.label, Mark.x.stringValue)
        
        button3.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button3.label, Mark.o.stringValue)
        
        button4.tap()
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        
        button5.tap()
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        XCTAssertEqual(button5.label, Mark.o.stringValue)
        
        button6.tap()
        XCTAssertEqual(turnLabel.label, "Player X won!")
        XCTAssertEqual(button6.label, Mark.x.stringValue)
    }
    
    func testRestartingGame() {
        // Tap a square so the board is not empty
        let button4 = buttonFor(4)
        button4.tap()
        
        // Make sure a mark has been placed on the board
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        
        // Check for the next player's turn
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        restartButton.tap()
        
        for i in 0...8 {
            XCTAssertEqual(buttonFor(i).label, Mark.empty.stringValue)
        }
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//        let app = XCUIApplication()
//        app.launch()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }

//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
////        let app = XCUIApplication()
////        app.launch()
//
//        let app = XCUIApplication()
//        app.buttons["button0"].tap()
//        app.buttons["button3"].tap()
//        app.buttons["button6"].tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Restart"]/*[[".buttons[\"Restart\"].staticTexts[\"Restart\"]",".buttons[\"GameViewController.RestartButton\"].staticTexts[\"Restart\"]",".staticTexts[\"Restart\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
