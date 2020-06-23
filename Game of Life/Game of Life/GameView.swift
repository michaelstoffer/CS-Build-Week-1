//
//  GameView.swift
//  Game of Life
//
//  Created by Michael Stoffer on 6/19/20.
//  Copyright © 2020 Michael Stoffer. All rights reserved.
//

import UIKit

class GameView: UIView {
	
	var game: GameState = GameState(size: 100)
	var cellSize: Int = 10
	
	public convenience init(gameSize: Int, cellSize: Int) {
		let frame = CGRect(x: 0, y: 0, width: gameSize * cellSize, height: gameSize * cellSize)
		self.init(frame: frame)
		self.game = GameState(size: gameSize)
		self.cellSize = cellSize
	}
	
	public convenience init() {
		let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
		self.init(frame: frame)
	}

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
		context?.saveGState()
		
		for cell in game.cells {
			let rect = CGRect(x: cell.x * cellSize, y: cell.y * cellSize, width: cellSize, height: cellSize)
			let color = cell.state == .alive ? UIColor(named: "GLGreen")!.cgColor : UIColor(named: "GLRed")!.cgColor
			context?.addRect(rect)
			context?.setFillColor(color)
			context?.fill(rect)
		}
		
		context?.restoreGState()
    }
	
	public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		game.updateCells()
		setNeedsDisplay()
	}
	
	public func advanceOneStep() {
		game.updateCells()
		setNeedsDisplay()
	}
	
	public func autoRun() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			self.game.updateCells()
			self.setNeedsDisplay()
			self.autoRun()
		}
	}

}
