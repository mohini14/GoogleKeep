//
//  CoreDate.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 02/08/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit
import CoreData

class CoreData: NSObject {

	static var managedContext : NSManagedObjectContext? = nil
	
	class func getManagedObjectContext()
	{
		//1
		guard let appDelegate =
			UIApplication.shared.delegate as? AppDelegate else
		{
			return
		}
		
		managedContext =
			appDelegate.persistentContainer.viewContext
	}

	//MARK: Note related methods
	
	class func saveANewNote(_ newNote : Note){
		
		CoreData.getManagedObjectContext()
		
		let entity = NSEntityDescription.entity(forEntityName:Define.CoreDataEntitynames.kNoteEntity, in:managedContext!)
		
		let newNoteToSave = NSManagedObject(entity: entity!,
		                               insertInto: managedContext)
		
		//save values for entity attributes
		newNoteToSave.setValue(newNote.noteHeading , forKeyPath: Define.NoteEntityAttributeNames.kNoteHeadingAttribute)
		newNoteToSave.setValue(newNote.noteDescription , forKeyPath: Define.NoteEntityAttributeNames.kNoteDescriptionAttribute)
		newNoteToSave.setValue(newNote.noteDate , forKeyPath: Define.NoteEntityAttributeNames.kNoteDateAttribuet)
		
		// using try catch while saving
		do
		{
			try managedContext?.save()
		}
		catch let error as NSError
		{
			print("Could not save. \(error), \(error.userInfo)")
		}
	}
	
	class func fetchAllNotes() -> Array<Note>?{
		CoreData.getManagedObjectContext()
		
		var array = Array<Note>()
		
		let fetchRequest = NSFetchRequest<Note>(entityName:Define.CoreDataEntitynames.kNoteEntity)
		
		do
		{
			let fetchedResults = try managedContext!.fetch(fetchRequest)
			for item in fetchedResults
			{
				array.append(item)
			}
			
			return array
		} catch let error as NSError
		{
			// something went wrong, print the error.
			print(error.description)
		}
		
		return nil
	}
	
}
