//
//  ManageTargetTableViewCell.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 02/02/22.
//

import UIKit
import MaterialComponents.MDCCard

class ManageTargetTableViewCell: UITableViewCell {

    @IBOutlet weak var targetTitle: UILabel!
    @IBOutlet weak var targetSteps: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
