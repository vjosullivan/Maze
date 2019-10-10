//
//  CellView.swift
//  Mazes
//
//  Created by Vincent O'Sullivan on 30/09/2019.
//  Copyright © 2019 Vincent O'Sullivan. All rights reserved.
//

import SwiftUI

struct CellView: View {
    
    var cell:Cell
    
    var body: some View {
        
        let wallThickness:CGFloat = 10
        let linkColor = Color.green.opacity(0.4)
        let wallColor = Color.black
        let cellColor = Color(red: 1.0, green: 0.99, blue: 0.82)
        
        let corner = Rectangle()
            .fill(wallColor)
            .frame(height: wallThickness)
        
        return ZStack {
            HStack(spacing: 0) {
                // Left stack
                VStack(spacing: 0) {
                    // Top left.
                    corner
                    // Middle left.
                    Rectangle()
                        .fill(cell.isLinked(to: cell.west) ? linkColor.opacity(0.7) : wallColor)
                    // Top right.
                    corner
                }
                .frame(width: wallThickness)
                // Centre stack
                VStack(spacing: 0) {
                    // Top middle.
                    Rectangle()
                        .fill(cell.isLinked(to: cell.north) ? linkColor.opacity(0.7) : wallColor)
                        .frame(height: wallThickness)
                    // Centre (cell contents).
                    Rectangle()
                        .fill(cellColor)
                    // Bottom middle.
                    Rectangle()
                        .fill(cell.isLinked(to: cell.south) ? linkColor.opacity(0.7) : wallColor)
                        .frame(height: wallThickness)
                }
                // Right stack.
                VStack(spacing: 0) {
                    // Bottom left.
                    corner
                    // Middle  right
                    Rectangle()
                        .fill(cell.isLinked(to: cell.east) ? linkColor.opacity(0.7) : wallColor)
                    // Bottom right.
                    corner
                }
                .frame(width: wallThickness)
            }
            //.padding(0.0)
            Text(String.init(describing: cell))
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        let leftCell  = Cell(row: 1, col: 1)
        let rightCell = Cell(row: 1, col: 2)
        leftCell.east = rightCell
        rightCell.west = leftCell
        leftCell.addLink(to: rightCell)
        return VStack {
            HStack {
                CellView(cell: leftCell)
                CellView(cell: rightCell)
            }
            Text("Preview of two linked cells.").padding()
        }.previewLayout(.fixed(width: 600.0, height: 360.0))
    }
}
