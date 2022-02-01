//
//  ViewController.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//
import UIKit

class ViewController: UIViewController  {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
        
    var popupDelegates: popupDelegates?
    
    var stepTargetCellDataSource: TargetDataSource?

    var items:[StepsTarget]?{
        didSet {
            guard let data = items else {
                return
            }
            self.stepTargetCellDataSource  = TargetDataSource(data: data, pSize: self.pageSize,collectionView: self.collectionView)
            DispatchQueue.main.async {
                self.collectionView.dataSource = self.stepTargetCellDataSource
                self.collectionView.delegate   = self.stepTargetCellDataSource
                self.collectionView.reloadData()
            }
            self.stepTargetCellDataSource?.onScroll = { curentPage in
                self.currentPage = curentPage
            }
        }
    }

    var currentPage: Int = 0 {
        didSet {
            if currentPage < self.items?.count ?? 0 {
            let obj = self.items?[self.currentPage]
            self.targetLabel.text = kTarget + ": " + "\(obj?.target ?? 0)"
            self.infoLbl.text = kStepsTaken + ": " + "\(obj?.stepsTaken ?? 0)"
            self.dateLabel.text = kDate + ": " + "\(String(describing: obj?.timestamp))"
            }
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
    
    var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.setupAddStepsButton()
        //self.insertRecord()
        self.fetchData()
        self.currentPage = 0
        self.addObserver()
        // Do any additional setup after loading the view.
    }
}

extension ViewController {
 func getFieldValues() -> Dictionary<String, AnyObject> {
    var fieldDetails = [String: AnyObject]()
    fieldDetails[StepsTargetAttributes.target.rawValue] = 7000 as AnyObject
    fieldDetails[StepsTargetAttributes.stepsTaken.rawValue] = 1150 as AnyObject
    fieldDetails[StepsTargetAttributes.timestamp.rawValue] = Date() as AnyObject//Date.currentTimeStamp
    return fieldDetails
}
}

extension ViewController : popupDelegates {
    func didPressSaveBtn() {
      //  CoreDataHelper.insertRecord(entity: <#NSManagedObject.Type#>, entityName: <#String#>, completion: <#(NSManagedObject, NSManagedObjectContext) -> ()#>)
    } 
}
