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
    
    func setCircularProgressView(stepsCompleted:Int, stepsTarget:Int){
        circularProgressView.setCircleStrokeColor(UIColor(red: 232/255.0, green: 233/255.0, blue: 232/255.0, alpha: 1.0), circleFillColor: UIColor.white, progressCircleStrokeColor: UIColor.yellow, progressCircleFillColor: UIColor.white)
        
        let completeProgress: CGFloat = CGFloat(stepsTarget)
        let progressCompleted: CGFloat = CGFloat(stepsCompleted)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] (timer) in
            
            self?.circularProgressView.progress = CGFloat(progressCompleted/completeProgress)
            let completedPersentage = Int(progressCompleted/completeProgress*100)
            self?.circularProgressView.setProgressText("\(completedPersentage > 100 ? 100 : completedPersentage)" + "%")
            
        }
    }
}
