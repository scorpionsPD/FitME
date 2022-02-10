//
//  HistoricCollectionCell.swift
//  FitMeApp
//  Created by ASPL on 04/02/22.
//
import UIKit

class HistoricCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var circularProgressView:BRCircularProgressView!
    @IBOutlet weak var targetNameLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
