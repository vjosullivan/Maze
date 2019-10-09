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
        // Setup - Create different cells.
        let cell1 = Cell(row: 0, col: 0)
        let cell2 = Cell(row: 0, col: 1)

        // Action - Link cells.
        cell1.addLink(to: cell2)
        
        // Result - Two way link between cells.
        XCTAssertTrue(cell1.isLinked(to: cell2))
        XCTAssertTrue(cell2.isLinked(to: cell1))
    }
    
    func test_CannotLinkToSelf() {
        // Setup - Create two identical cells.
        let cell1a = Cell(row: 0, col: 0)
        let cell1b = Cell(row: 0, col: 0)

        // Action - Link cells.
        cell1a.addLink(to: cell1b)
        
        // Result - Neither cell linked to other.
        XCTAssertFalse(cell1a.isLinked(to: cell1b))
        XCTAssertFalse(cell1b.isLinked(to: cell1a))
    }
    
    func test_RemoveLinkFromLinkedCell() {
        // Setup - Create and link two cells (and confirm links exist).
        let cell1 = Cell(row: 0, col: 0)
        let cell2 = Cell(row: 0, col: 1)
        cell1.addLink(to: cell2)
        XCTAssertTrue(cell1.isLinked(to: cell2))
        XCTAssertTrue(cell2.isLinked(to: cell1))
        
        // Action - Unlink cells.
        cell1.removeLink(to: cell2)
        
        // Result - Cells are unlinked.
        XCTAssertFalse(cell1.isLinked(to: cell2))
        XCTAssertFalse(cell2.isLinked(to: cell1))
    }
}
