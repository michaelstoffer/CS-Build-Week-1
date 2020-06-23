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
	
	let generator = UINotificationFeedbackGenerator()
	var world = GameState(size: 25)
	var startStop: Bool = false
	var timer: Timer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		generator.prepare()
		
		gameView.delegate = self
		gameView.dataSource = self
	}

	// MARK: - IBActions and Methods
	
	@IBAction func playPauseToggle(_ sender: Any) {
		startStop.toggle()
		timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(setAutoRun), userInfo: nil, repeats: true)
		generator.notificationOccurred(.success)
	}
	
	@IBAction func advanceOneStep(_ sender: Any) {
		self.world.updateCells()
		self.gameView.reloadData()
		generator.notificationOccurred(.success)
	}
	
	@IBAction func stopButton(_ sender: Any) {
		startStop = false
		world = GameState(size: 25)
		world.updateCells()
		self.gameView.reloadData()
		generator.notificationOccurred(.success)
	}
	
	@objc func setAutoRun(timer: Timer) {
		self.world.updateCells()
		self.gameView.reloadData()
		
		if !startStop {
			timer.invalidate()
		}
	}
	
	func autoRun(run: Bool) {
		if startStop {
			DispatchQueue.main.asyncAfter(deadline: .now()) {
				self.world.updateCells()
				self.gameView.reloadData()
				self.autoRun(run: run)
			}
		}
	}
	
}

extension GameViewController: UICollectionViewDelegate {
	
}

extension GameViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.world.cells.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath)
		
		let singleCell = self.world.cells[indexPath.row]
		cell.layer.backgroundColor = singleCell.state == State.alive ? UIColor(named: "GLGreen")!.cgColor : UIColor(named: "GLRed")!.cgColor
		
		return cell
	}
}
