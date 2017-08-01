//
//  MenuTableViewCell.swift
//  GoogleKeep
//
//  Created by Mohini Sindhu  on 01/08/17.
//  Copyright © 2017 Mohini Sindhu . All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
	
	//MARK: IBOutlets
	@IBOutlet weak var menuName : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	public func setCellProperties (_ labelString : String){
		
		if (self.menuName != nil)
		{
			self.menuName.text = "   " + labelString
		}
	}

}
