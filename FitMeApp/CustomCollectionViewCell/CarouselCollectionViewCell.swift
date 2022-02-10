//
//  CarouselCollectionViewCell.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var targetBtn: UIButton!
    @IBOutlet weak var circularProgressView: BRCircularProgressView!
    var didPressTarget:((Any)->())?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func targetPressed(_ sender: Any) {
        didPressTarget!(sender)
    }
    func setCircularProgressView(stepsCompleted:Int, stepsTarget:Int){
        circularProgressView.setCircleStrokeColor(UIColor(red: 232/255.0, green: 233/255.0, blue: 232/255.0, alpha: 1.0), circleFillColor: UIColor.white, progressCircleStrokeColor: UIColor.yellow, progressCircleFillColor: UIColor.white)
        
        let completeProgress: CGFloat = CGFloat(stepsTarget)
        let progressCompleted: CGFloat = CGFloat(stepsCompleted)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] (timer) in
            
            self?.circularProgressView.progress = CGFloat(progressCompleted/completeProgress)
            self?.circularProgressView.setProgressText("\(Int(progressCompleted))/\(Int(completeProgress))")
            
        }
    }
}
