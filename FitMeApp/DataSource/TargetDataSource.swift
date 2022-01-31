//
//  TargetDataSource.swift
//  FitMeApp
//
//  Created by ASPL on 28/01/22.
//
import UIKit
import Foundation

class TargetDataSource: NSObject {
    var dataArray : [StepsTarget]?

    init(data:[StepsTarget]) {
        super.init()
        self.dataArray = data
    }
}

extension TargetDataSource:UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CarouselCollectionViewCell.self), for: indexPath) as! CarouselCollectionViewCell
        if (self.dataArray?[indexPath.item] as? StepsTarget) != nil{//items[(indexPath as
            cell.getImageName(index: indexPath.item)
       }
        return cell
    }
}
