//
//  GameViewController.swift
//  Game of Life
//
//  Created by Michael Stoffer on 6/15/20.
//  Copyright © 2020 Michael Stoffer. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

	// MARK: - IBOutlets and Properties

	@IBOutlet weak var gameView: UICollectionView!
	@IBOutlet weak var generationLabel: UILabel!
	
	let generator = UINotificationFeedbackGenerator()
	var world = GameState(size: 25)
	var startStop: Bool = false
	var timer: Timer?
	var generationCount = 0 {
		didSet {
			generationLabel.text = String(generationCount)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		generator.prepare()
		
		self.generationLabel.text = String(generationCount)

		gameView.delegate = self
		gameView.dataSource = self
	}

	// Shake phone to reset
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		self.resetGame()
		generator.notificationOccurred(.success)
	}

	// MARK: - IBActions and Methods

	@IBAction func playPauseToggle(_ sender: Any) {
		startStop.toggle()
		timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(setAutoRun), userInfo: nil, repeats: true)
		generator.notificationOccurred(.success)
	}

	@IBAction func advanceOneStep(_ sender: Any) {
		self.world.updateCells()
		generationCount += 1
		self.gameView.reloadData()
		generator.notificationOccurred(.success)
	}

	@IBAction func stopButton(_ sender: Any) {
		self.resetGame()
		generator.notificationOccurred(.success)
	}

	@IBAction func clearButton(_ sender: Any) {
		self.resetGrid()
		generator.notificationOccurred(.success)
	}
	
	@objc func setAutoRun(timer: Timer) {
		if !startStop {
			timer.invalidate()
		} else {
			generationCount += 1
			self.world.updateCells()
			self.gameView.reloadData()
		}
	}

	private func resetGrid() {
		startStop = false
		var updatedCells: [GameCell] = []
		world = GameState(size: 25)
		for cell in world.cells {
			updatedCells.append(GameCell(x: cell.x, y: cell.y, state: .dead))
		}
		world.cells = updatedCells
		generationCount = 0
		self.gameView.reloadData()
	}

	private func resetGame() {
		startStop = false
		world = GameState(size: 25)
		world.updateCells()
		generationCount = 0
		self.gameView.reloadData()
	}

}

extension GameViewController: UICollectionViewDelegate {}
extension GameViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.world.cells.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath)

		let singleCell = self.world.cells[indexPath.row]
		cell.layer.backgroundColor = singleCell.state == State.alive ? UIColor(named: "GLGreen")!.cgColor : UIColor(named: "GLRed")!.cgColor
		cell.layer.cornerRadius = singleCell.state == State.alive ? cell.bounds.height/2 : cell.bounds.height/4
				
		return cell
	}
}
