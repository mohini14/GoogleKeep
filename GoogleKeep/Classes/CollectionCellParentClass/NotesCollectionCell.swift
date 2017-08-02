//
//  NotesCollectionCell.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 01/08/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit
import CoreData

let extraPeddingRequired = CGFloat(40.0)

class NotesCollectionCell: UICollectionViewCell {
	
	//MARK: IBOutlets
	@IBOutlet weak var NoteHeadingLabel : UILabel!
	@IBOutlet weak var NoteDescriptionLabel : UILabel!
 // mistake : change to small
	
	var onFetchingCellSize : ((CGFloat) -> Void?)? = nil
	
	//MARK: Over rided methods
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	//MARK: Instance methods
	func setUpCellAttributes(_ noteDetails : Note, withCompletionHandler onFetchingCellSize:(CGFloat)-> Void ){
		
		if self.NoteHeadingLabel != nil{
			self.NoteHeadingLabel.text = noteDetails.noteHeading
		}
		
		if self.NoteDescriptionLabel != nil{
			self.NoteDescriptionLabel.text = noteDetails.noteDescription
		}
		
//		let ht = self.setCellHieght(noteDetails)
//		if let onFetchingCellSize = self.onFetchingCellSize{
//			onFetchingCellSize(ht)
//		}
		
//		self.setCellHieght(noteDetails)
	}
	
	//MARK: private methods
	private func setCellHieght(_ noteDetails : Note) {
		
		let ht  = self.NoteDescriptionLabel.frame.size.height + self.NoteHeadingLabel.frame.size.height + extraPeddingRequired
		self.frame.size = CGSize(width : 414.0 , height: ht)
	}
}
