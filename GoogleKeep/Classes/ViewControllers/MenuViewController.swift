//
//  MenuViewController.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 27/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

enum MenuType : String{
	case Notes = "Notes"
	case Reminder = "Reminders"
}

class MenuViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

	//MARK: IBOutlets
	
	@IBOutlet weak var viewOverImageView : UIView!
	@IBOutlet weak var menuTableView : UITableView!
	
	// MARK:Private variables
	var menuArray : Array<String>?
	
	
    override func viewDidLoad(){
        super.viewDidLoad()
		initialVCSetup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: Private methods
	func initialVCSetup(){
		self.viewOverImageView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
		
		self.menuArray = [MenuType.Notes.rawValue,MenuType.Reminder.rawValue]
	}
	
	//MARK: table view data source methods
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return (self.menuArray?.count)!
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell : MenuTableViewCell!
	    cell  = tableView.dequeueReusableCell(withIdentifier: Define.CellIdentifireConstant.kMenuTableCellIdentifier, for:indexPath) as! MenuTableViewCell
	
	    if cell == nil
		{
			  cell = MenuTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:Define.CellIdentifireConstant.kMenuTableCellIdentifier)
		}
		
		cell.setCellProperties((self.menuArray?[indexPath.row])!)
		return cell
	}
	
	//MARK: Menu table view Delegate methods
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let menuType = (self.menuArray?[indexPath.row])!
		var SegueName : String?
		switch menuType
		{
		case MenuType.Notes.rawValue:
			 SegueName = Define.SegueIdentifiers.kMenuVCToHomeVC
//		case MenuType.Reminder.rawValue :
//			SegueName = " "
		default:
			SegueName = nil
		}
		
		if SegueName != nil{
		self.performSegue(withIdentifier: SegueName!, sender: indexPath)
		}
		
	}
	
}
