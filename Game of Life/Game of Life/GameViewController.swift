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
	
	@IBOutlet var gameView: UIView!
	
	//	var i = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		let btn = UIButton()
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(btn)
//
//		btn.widthAnchor.constraint(equalToConstant: 128).isActive = true
//		btn.heightAnchor.constraint(equalToConstant: 128).isActive = true
//		btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//		btn.setTitle("Tap here!", for: .normal)
//		btn.setTitleColor(UIColor.red, for: .normal)
//		btn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
	}

	// MARK: - IBActions and Methods
	
	@IBAction func playPauseToggle(_ sender: Any) {
	}
	
	@IBAction func advanceOneStep(_ sender: Any) {
	}
	
	@IBAction func stopButton(_ sender: Any) {
	}
	
//	@objc func tapped() {
//		i += 1
//		print("Running \(i)")
//
//		switch i {
//			case 1:
//				let generator = UINotificationFeedbackGenerator()
//				generator.prepare()
//				generator.notificationOccurred(.error)
//
//			case 2:
//				let generator = UINotificationFeedbackGenerator()
//				generator.prepare()
//				generator.notificationOccurred(.success)
//
//			case 3:
//				let generator = UINotificationFeedbackGenerator()
//				generator.prepare()
//				generator.notificationOccurred(.warning)
//
//			case 4:
//				let generator = UIImpactFeedbackGenerator(style: .light)
//				generator.prepare()
//				generator.impactOccurred()
//
//			case 5:
//				let generator = UIImpactFeedbackGenerator(style: .medium)
//				generator.prepare()
//				generator.impactOccurred()
//
//			case 6:
//				let generator = UIImpactFeedbackGenerator(style: .heavy)
//				generator.prepare()
//				generator.impactOccurred()
//
//			default:
//				let generator = UISelectionFeedbackGenerator()
//				generator.selectionChanged()
//				i = 0
//		}
//	}
	
}

