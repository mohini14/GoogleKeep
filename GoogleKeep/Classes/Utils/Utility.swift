//
//  Utility.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 27/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class Utility: NSObject {
	
	//MARK:Alerts on Screen
	class func promptMessageOnScreen (_ message : String, viewContoller: UIViewController) -> ()
	{
		
		let alert = UIAlertController(title: NSLocalizedString("ALert", comment: "") ,message: message , preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler:nil))
		viewContoller.present(alert, animated:true, completion:nil)
	}
	
	
	//MARK: SWReveal helper methods
	class func setSliderBarPropertyWithVC (sender : UIViewController){
		

		let revealViewController : SWRevealViewController! = sender.revealViewController()
		
		if revealViewController != nil
		{
			let slidBarButtonItem : UIBarButtonItem = UIBarButtonItem(image: UIImage(named:Define.ImageName.kSlideBarImage), landscapeImagePhone: nil, style: .plain, target: sender.revealViewController(), action: #selector(sender.revealViewController().revealToggle(_:)))
			sender.navigationItem.leftBarButtonItem = slidBarButtonItem
			sender.revealViewController().rearViewRevealWidth = (sender.view.frame.width / (2)) + 40;

			sender.view.addGestureRecognizer(sender.revealViewController().panGestureRecognizer())
		}
	}
	
	//MARK: Date and time methods
	class func getCurrentDate() -> (Int,Int,Int){
		
		let date = Date()
		let calendar = Calendar.current
		let components = calendar.dateComponents([.year, .month, .day], from: date)
		
		let year =  components.year
		let month = components.month
		let day = components.day
		
		let currentDate = (day!,month!,year!)
		
		return currentDate 
	}
}
