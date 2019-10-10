//
//  Cell.swift
//  Mazes
//
//  Created by Vincent O'Sullivan on 29/09/2019.
//  Copyright © 2019 Vincent O'Sullivan. All rights reserved.
//

import Foundation

class Cell {
    
    // MARK: - Properties
    
    let row: Int
    let col: Int
    
    public private(set) var links: [Cell]
    
    public var north: Cell?
    public var south: Cell?
    public var east: Cell?
    public var west: Cell?
    
    // MARK: - Initialisers
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
        
        self.links = []
    }
    
    // MARK: - Public Functions
    
    public func addLink(to cell: Cell) {
        addLink(to: cell, addReturnLink: true)
    }
    
    public func removeLink(to cell: Cell) {
        removeLink(to: cell, deleteReturnLink: true)
    }
    
    /// Returns `true` if the other `Cell` is linked to this one, otherwise `false`.
    /// - Parameter cell: The other cell.
    public func isLinked(to cell: Cell?) -> Bool {
        guard let cell = cell else { return false }
        return links.contains(cell)
    }

    // MARK: - Private Functions

    /// Removes a link between this cell and another.
    /// - Parameter cell: The `Cell` to be linked to.
    /// - Parameter deleteReturnLink: if `true` (the default) then the other cell
    ///             is also unlinked from this one.  (Mainly used internally
    ///             to prevent infinite cell unlinking loops.)
    ///
    fileprivate func removeLink(to cell: Cell, deleteReturnLink: Bool) {
        links = links.filter { $0 != cell }
        if deleteReturnLink {
            cell.removeLink(to: self, deleteReturnLink: false)
        }
    }
    
    /// Adds a link between this cell and another (different) cell.
    /// - Parameter cell: The `Cell` to be linked to.
    /// - Parameter addReturnLink: if `true` (the default) then the other cell
    ///             is also linked back to this one.  (Mainly used internally
    ///             to prevent infinite cell linking loops.)
    ///
    fileprivate func addLink(to cell: Cell, addReturnLink: Bool) {
        guard !links.contains(cell) && self != cell else {
            return
        }
        links.append(cell)
        if addReturnLink {
            cell.addLink(to: self, addReturnLink: false)
        }
    }
}

extension Cell: Equatable {
    static func == (lhs: Cell, rhs: Cell) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
}

extension Cell: CustomStringConvertible {
    var description: String {
        return "r\(self.row) c\(self.col)"
    }
}
