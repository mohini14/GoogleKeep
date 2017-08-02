//
//  AddNewNoteView.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 02/08/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit
import CoreData

class AddNewNoteView: UIView {

  //MARK: IBoutlets
	@IBOutlet weak var noteTitleTextField : UITextField!
	@IBOutlet weak var noteDescriptionTextView : UITextView!
	
	//MARK: variables
	
	var onFetchingNewNote : ((_ fetchedNote : Note) -> Void)?

	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
	}
	
	//MARK: Private methods
	func initSettings(){
	}

	func convertDateTupleToString() -> (String){
		
		let dateTuple = Utility.getCurrentDate()
		let dateString : String = String(dateTuple.0) + "-" + String(dateTuple.1) + "-" + String(dateTuple.2)
		return dateString
	}
	
	//MARK: Actions on NIB
	@IBAction func saveNoteButtonPressed(_ sender: Any) {
		
	
	 CoreData.getManagedObjectContext()
		
	let newNote = Note.init(entity: NSEntityDescription.entity(forEntityName: Define.CoreDataEntitynames.kNoteEntity , in:CoreData.managedContext!)!, insertInto: CoreData.managedContext)
		
		if !((self.noteDescriptionTextView?.text.isEmpty)!){
			
			// get current date
		
			newNote.noteDate = self.convertDateTupleToString()
			
			newNote.noteHeading = self.noteTitleTextField.text
			
			newNote.noteDescription = self.noteDescriptionTextView.text
			
			if let onFetchingNewNote = onFetchingNewNote{
				onFetchingNewNote(newNote)
				self.removeFromSuperview()
			}
		}
		else{
			self.removeFromSuperview()
		}
	}
	
	@IBAction func cancelButtonPressed(_ sender: Any) {
		
		self.removeFromSuperview()
	}
}
