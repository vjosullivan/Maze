//
//  CellTests.swift
//  MazesTests
//
//  Created by Vincent O'Sullivan on 29/09/2019.
//  Copyright © 2019 Vincent O'Sullivan. All rights reserved.
//

import XCTest
@testable import Mazes

class CellTests: XCTestCase {
    
    /// Test: Can create cell.
    func test_CanCreateCell() {
        // Setup.  Perform action.  Confirm expectations.
        XCTAssertNotNil(Cell(row: 0, col: 0))
    }
    
    func test_AddLinkToCell() {
        // Setup.
        let cell1 = Cell(row: 0, col: 0)
        let cell2 = Cell(row: 0, col: 1)
        let cell3 = Cell(row: 0, col: 2)

        // Perform action.
        cell1.addLink(to: cell2)
        
        // Confirm expectations.
        XCTAssertTrue(cell1.isLinked(to: cell2))
        XCTAssertTrue(cell2.isLinked(to: cell1))
        XCTAssertFalse(cell1.isLinked(to: cell3))
    }
    
    func test_CannotLinkToSelf() {
        // Setup.
        let cell1a = Cell(row: 0, col: 0)
        let cell1b = Cell(row: 0, col: 0)

        // Perform action.
        cell1a.addLink(to: cell1b)
        
        // Confirm expectations.
        XCTAssertFalse(cell1a.isLinked(to: cell1b))
        XCTAssertFalse(cell1b.isLinked(to: cell1a))
    }
    
    func test_RemoveLinkFromLinkedCell() {
        // Setup.
        let cell1 = Cell(row: 0, col: 0)
        let cell2 = Cell(row: 0, col: 1)
        cell1.addLink(to: cell2)
        XCTAssertTrue(cell1.isLinked(to: cell2))
        XCTAssertTrue(cell2.isLinked(to: cell1))
        
        // Perform action.
        cell1.removeLink(to: cell2)
        
        // Confirm interim expectations.
        XCTAssertFalse(cell1.isLinked(to: cell2))
        XCTAssertFalse(cell2.isLinked(to: cell1))
    }
}
