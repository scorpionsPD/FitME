//
//  TargetDataSource.swift
//  FitMeApp
//
//  Created by ASPL on 28/01/22.
//
import UIKit
import Foundation

class TargetDataSource: NSObject {
    var dataArray:[StepsTarget]?
    var collctionView:UICollectionView?
    var pageSize:CGSize?
    var onScroll:((Int)->())?
    var onDeleteAction:((StepsTarget)->())?
    var stepsTaken: StepsTarget?
    init(data:[StepsTarget],pSize:CGSize,stepsTaken: StepsTarget,collectionView:UICollectionView) {
        super.init()
        self.dataArray = data
        self.collctionView = collectionView
        self.pageSize = pSize
        self.stepsTaken = stepsTaken
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
        if self.dataArray?[indexPath.item] != nil{//items[(indexPath as
            let obj = self.dataArray?[indexPath.row]
         //   cell.setCircularProgressView(stepsCompleted: self.stepsTaken?.stepsTaken, stepsTarget: Int(obj?.target ?? 0))
       }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        if let obj = self.dataArray?[indexPath.row] {
        self.onDeleteAction!(obj)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collctionView!.collectionViewLayout as! CollectionViewCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize?.width : self.pageSize?.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        let currentPage = Int(floor((offset - pageSide! / 2) / pageSide!) + 1)
        self.onScroll!(currentPage)
    }
}
