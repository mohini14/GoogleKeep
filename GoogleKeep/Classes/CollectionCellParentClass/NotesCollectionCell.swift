//
//  NotesCollectionCell.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 01/08/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit
import CoreData

let extraPeddingRequired = CGFloat(20.0)

class NotesCollectionCell: UICollectionViewCell {
	
	//MARK: IBOutlets
	@IBOutlet weak var NoteHeadingLabel : UILabel!
	@IBOutlet weak var NoteDescriptionLabel : UILabel!

	
	//MARK: Over rided methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	//MARK: Instance methods
	func setUpCellAttributes(_ noteDetails : Note){
		
		if self.NoteHeadingLabel != nil{
			self.NoteHeadingLabel.text = noteDetails.noteHeading
		}
		
		if self.NoteDescriptionLabel != nil{
			self.NoteDescriptionLabel.text = noteDetails.noteDescription
		}
		
		// cell hieght is dynamic
		self.setCellHieght(noteDetails)
	}
	
	//MARK: private methods
	private func setCellHieght(_ noteDetails : Note){
		
		self.frame.size.height = self.NoteDescriptionLabel.frame.size.height + self.NoteHeadingLabel.frame.size.height + extraPeddingRequired
	}
}
