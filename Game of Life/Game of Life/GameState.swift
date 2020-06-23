//
//  GameState.swift
//  Game of Life
//
//  Created by Michael Stoffer on 6/18/20.
//  Copyright © 2020 Michael Stoffer. All rights reserved.
//

import Foundation

struct GameState {
	var cells: [GameCell] = []
	let size: Int
	
	init(size: Int) {
		self.size = size
		
		for x in 0..<size {
			for y in 0..<size {
				let randomState = arc4random_uniform(3)
				let cell = GameCell(x: x, y: y, state: randomState == 0 ? .alive : .dead)
				cells.append(cell)
			}
		}
	}
	
	mutating func updateCells() {
		var updatedCells: [GameCell] = []
		let liveCells: [GameCell] = cells.filter { $0.state == .alive }
		
		for cell in cells {
			let livingNeighbors = liveCells.filter { $0.isNeighbor(to: cell) }
			
			switch livingNeighbors.count {
				case 2...3 where cell.state == .alive:
					updatedCells.append(cell)
				case 3 where cell.state == .dead:
					let liveCell = GameCell(x: cell.x, y: cell.y, state: .alive)
					updatedCells.append(liveCell)
				default:
					let deadCell = GameCell(x: cell.x, y: cell.y, state: .dead)
					updatedCells.append(deadCell)
			}
		}
		
		self.cells = updatedCells
	}
}
