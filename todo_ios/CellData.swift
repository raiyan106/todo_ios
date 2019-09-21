//
//  CellData.swift
//  todo_ios
//
//  Created by Raiyan Khan on 21/9/19.
//  Copyright © 2019 Raiyan Khan. All rights reserved.
//

import UIKit

class CellData: UITableViewCell {
    
    @IBOutlet var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
