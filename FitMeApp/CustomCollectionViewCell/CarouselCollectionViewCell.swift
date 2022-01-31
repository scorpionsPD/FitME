//
//  CarouselCollectionViewCell.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    var imgStr : String = "" {
        didSet{
            DispatchQueue.main.async{
                self.image.image = UIImage(named: self.imgStr)
            }
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.layer.cornerRadius = max(self.contentView.frame.size.width, self.contentView.frame.size.height) / 2
//
//        self.contentView.layer.borderWidth = 10
//        self.contentView.layer.borderColor = UIColor(red: 110.0/255.0, green: 80.0/255.0, blue: 140.0/255.0, alpha: 1.0).cgColor
    }
    
    
    
    func getImageName(index:Int){
        let imgNameStr = "Img-" + "\(index)"
        self.imgStr = imgNameStr
    }
}
