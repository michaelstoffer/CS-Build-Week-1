//
//  GameCell.swift
//  Game of Life
//
//  Created by Michael Stoffer on 6/18/20.
//  Copyright © 2020 Michael Stoffer. All rights reserved.
//

import Foundation

public enum State {
	case alive
	case dead
}

struct GameCell {
	let x: Int
	let y: Int
	var state: State
	
	func isNeighbor(to cell: GameCell) -> Bool {
		let xDelta = abs(self.x - cell.x)
		let yDelta = abs(self.y - cell.y)
		
		switch (xDelta, yDelta) {
			case (1, 1), (0, 1), (1, 0):
				return true
			default:
				return false
		}
	}
}
