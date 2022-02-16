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
    @IBOutlet weak var editButton: UIButton!
    
    var onEditPress:((Int)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func editPressed(_ sender: Any) {
        onEditPress!(8)
    }
}
