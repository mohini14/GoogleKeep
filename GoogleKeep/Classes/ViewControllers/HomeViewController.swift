//
//  HomeViewController.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 27/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit
import CoreData

let kViewShadowOpacity = CGFloat(0.5)
let kViewShadowRadius  = Int(1)
let kViewShadowOffsetWidth = Int(-1)
let kViewShadowOffsethieght = Int(1)
let kviewShadowSize = CGFloat(5.0)
//let kSubViewTopConstartintValue = CGFloat(64.0)

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

	//MARK: IBOutlets
	@IBOutlet weak var notesCollectionView : UICollectionView!
	@IBOutlet weak var bottomView : UIView!
	
	
	//MARK: Private Oulets
	var notesArray : Array<Note>?
	var CellHieght : CGFloat?
	
	
	//MARK: View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
		initialVCSetup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	// MARK: Private methods
	func initialVCSetup(){
		
		title = "Keep"

		addToggleButton()
		InitialDeclarations()
		populateData()
		dropShadow(scale: true)
		addRefreshControlToCollectionView()
	}
	
	func populateData(){
		
		self.notesArray = CoreData.fetchAllNotes()
		
		if (notesArray?.count)! > 0 {
		self.notesCollectionView.reloadData()
		}
		self.notesCollectionView.refreshControl?.endRefreshing()
	}
	
	func addToggleButton(){
		
		Utility.setSliderBarPropertyWithVC(sender: self)
	}
	
	func dropShadow(scale: Bool = true) {
		
		self.bottomView.tintColor = Define.ColorConstants.KBaseColor
		
		self.bottomView.layer.masksToBounds = false
		self.bottomView.layer.shadowColor = UIColor.black.cgColor
		self.bottomView.layer.shadowOffset = CGSize.init(width: 5, height: 5)
		self.bottomView.layer.shadowOpacity = Float(kViewShadowOpacity)
		self.bottomView.layer.shadowRadius = 10
		self.bottomView.layer.shadowPath = UIBezierPath(rect: self.bottomView.bounds).cgPath
		self.bottomView.layer.shouldRasterize = true
		}
	
	func InitialDeclarations(){
	
		self.notesArray = Array()
		
		// register NIB
		let nib = UINib(nibName: Define.XIBNames.kNotesCollectionCellNIB, bundle: nil)
		self.notesCollectionView?.register(nib, forCellWithReuseIdentifier:Define.CellIdentifireConstant.kNoteCollectionCellIdentifier)
	}
	func addRefreshControlToCollectionView(){
		self.notesCollectionView.refreshControl = UIRefreshControl()
		self.notesCollectionView.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
		self.notesCollectionView.refreshControl?.addTarget(self, action: #selector(self.populateData), for: UIControlEvents.valueChanged)
	}
	
	//MARK: Collection view Data Source
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return (self.notesArray?.count)!
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell : NotesCollectionCell!
		
		cell = collectionView.dequeueReusableCell(withReuseIdentifier: Define.CellIdentifireConstant.kNoteCollectionCellIdentifier, for: indexPath) as! NotesCollectionCell
		
		
		cell.setUpCellAttributes((self.notesArray?[indexPath.row])!, withCompletionHandler: {
			(height) in
			
			self.CellHieght = height
		}
		)
		
	
		return cell
	}
	
//	//Use for size
//	func collectionView(_ collectionView: UICollectionView,
//	                    layout collectionViewLayout: UICollectionViewLayout,
//	                    sizeForItemAt indexPath: IndexPath) -> CGSize {
////		if let cellHt = self.CellHieght
////		{
////		return  CGSize(width: self.view.frame.size.width, height: cellHt + 20.0)
////		}
//		return CGSize (width: self.view.frame.size.width , height: 150.0)
//	}
//

	//MARK: Actions on VC
	@IBAction func addNewNoteButtonPressed(_ sender: Any) {
		
		let subView = Bundle.main.loadNibNamed(Define.XIBNames.kAddNewNoteViewNIB, owner: nil, options: nil)?.first as! AddNewNoteView
		
		let rect = CGRect(origin: CGPoint(x: 0,y :(self.navigationController?.navigationBar.frame.size.height)! + 10.0), size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height))
		subView.frame = rect
		self.view.addSubview(subView)
		
		subView.onFetchingNewNote = {
			(newNote : Note) -> Void in
			
			if !((newNote.noteDescription?.isEmpty)!){
				
				CoreData.saveANewNote(newNote)
			}
		}
		
	}
}
