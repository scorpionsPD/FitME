//
//  ViewController.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var stepTargetCellDataSource: TargetDataSource?

    fileprivate var items:[StepsTarget]?{
        didSet {
            guard let data = items else {
                return
            }
            self.stepTargetCellDataSource  = TargetDataSource(data: data)
            DispatchQueue.main.async {
                self.collectionView.dataSource = self.stepTargetCellDataSource
                self.collectionView.delegate   = self.stepTargetCellDataSource
                self.collectionView.reloadData()
            }
        }
    }

        
    fileprivate var currentPage: Int = 0 {
        didSet {
            let obj = self.items?[self.currentPage]
            self.targetLabel.text = "Target: \(obj?.target ?? 0)"
            self.infoLbl.text = "Steps Taken: \(obj?.stepsTaken ?? 0)"
            self.dateLabel.text = "Date: \(obj?.timestamp)"

        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! CollectionViewCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        
        let objToSave = self.getFieldValues()
        
        CoreDataHelper.shared.insertRecord(entity: StepsTarget.self, entityName: EntityTypes.StepsTargetEntity.rawValue) { entityDescription, objectContxt in
            if let entityDes = entityDescription as? StepsTarget {
            for (key, value) in objToSave {
                for attribute in StepsTargetAttributes.getAll {
                    if (key == attribute.rawValue) {
                        entityDes.setValue(value, forKey: key)
                    }
                }
            }
                CoreDataHelper.shared.saveContext(objectContxt){ success  in
                    if success {
                        self.fetchData()
                    }
                }
        }
        }
      
        self.currentPage = 0
      //  NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupLayout() {
        let layout = self.collectionView.collectionViewLayout as! CollectionViewCarouselFlowLayout
        layout.spacingMode = CollectionViewCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
    }
    
    @objc fileprivate func rotationDidChange() {
        guard !orientation.isFlat else { return }
        let layout = self.collectionView.collectionViewLayout as! CollectionViewCarouselFlowLayout
        let direction: UICollectionView.ScrollDirection = orientation.isPortrait ? .horizontal : .vertical
        layout.scrollDirection = direction
        if currentPage > 0 {
            let indexPath = IndexPath(item: currentPage, section: 0)
            let scrollPosition: UICollectionView.ScrollPosition = orientation.isPortrait ? .centeredHorizontally : .centeredVertically
            self.collectionView.scrollToItem(at: indexPath, at: scrollPosition, animated: false)
        }
    }

    fileprivate func fetchData(){
        CoreDataHelper.shared.fetchRecord(entity: StepsTarget.self) { result in
            if result.count > 0 {
               if let itms = result as? [StepsTarget] {
                  self.items = itms
               }
            }
//            for item in result {
//                if let dt = item as? StepsTarget {
//                    print(dt.stepsTaken)
//                }
//            }
        }
    }
    
    fileprivate func deleteData(){
        CoreDataHelper.shared.deleteRecord(entity: StepsTarget.self) { _ in
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! CollectionViewCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
}

extension ViewController {
fileprivate func getFieldValues() -> Dictionary<String, AnyObject> {
    var fieldDetails = [String: AnyObject]()
    fieldDetails[StepsTargetAttributes.target.rawValue] = 8000 as AnyObject
    fieldDetails[StepsTargetAttributes.stepsTaken.rawValue] = 1600 as AnyObject
    fieldDetails[StepsTargetAttributes.timestamp.rawValue] = Date() as AnyObject //Date.currentTimeStamp
    return fieldDetails
}
}


