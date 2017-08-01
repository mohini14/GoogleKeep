//
//  Define.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 27/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

struct Define
{
	struct ImageName
	{
		static let kSlideBarImage = "SlideBarButton.png"
	}
	
	struct IntegerConstants
	{
		static let kTwoConst  = CGFloat(2)
	}
	
	struct ColorConstants
	{
		static let kNavigationBarColor = UIColor(red: 238/255, green: 186/255, blue: 44/255, alpha: 1)
		static let KBaseColor = UIColor(red: 109/255, green: 87/255, blue: 16/255, alpha:1)
		
	}
	
	struct CellIdentifireConstant
    {
	    static let kMenuTableCellIdentifier = "MenuTableCell"
		static let kNoteCollectionCellIdentifier = "NoteCollectionCell"
	}

	struct XIBNames{
		
		static let kNotesCollectionCellNIB = "NotesCollectionCell"
	}
	struct SegueIdentifiers
    {
		static let kMenuVCToHomeVC = "MenuVCToHOmeVC"
	}
}
