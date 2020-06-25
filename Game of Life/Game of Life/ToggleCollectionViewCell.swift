//
//  ToggleCollectionViewCellDelegate.swift
//  Game of Life
//
//  Created by Michael Stoffer on 6/23/20.
//  Copyright © 2020 Michael Stoffer. All rights reserved.
//

import Foundation

protocol ToggleCollectionViewCellDelegate: class {
	func toggleCell(for cell: GridCollectionViewCell)
}
