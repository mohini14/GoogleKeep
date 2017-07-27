//
//  Utility.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 27/07/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class Utility: NSObject {
	
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
}
