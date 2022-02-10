//
//  ViewController.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//
import UIKit
import MaterialComponents

class ViewController: UIViewController  {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var floatingButton: MDCFloatingButton!
    
    var selectedRowStepsTargetObj: StepsTarget?{
        didSet {
            guard let _ = selectedRowStepsTargetObj else {
                return
            }
            self.deleteRecordWithDate(rowObject: selectedRowStepsTargetObj!)
        }
    }
            
    var stepTargetCellDataSource: HomeDataSource?

    var stepsTaken:StepsTarget?{
        didSet{
            guard stepsTaken != nil else { return }
            self.infoLbl.text = kStepsTaken + ": " + "\(stepsTaken?.stepsTaken ?? 0)"
            self.fetchTargets()
        }
        
    }
    var items:[StepsTarget]?{
        didSet {
            guard let data = items else {
                return
            }
//            self.stepTargetCellDataSource  = TargetDataSource(data: data, pSize: self.pageSize,collectionView: self.collectionView)
//            DispatchQueue.main.async {
//                self.collectionView.dataSource = self.stepTargetCellDataSource
//                self.collectionView.delegate   = self.stepTargetCellDataSource
//                self.collectionView.reloadData()
//            }
//            self.stepTargetCellDataSource?.onScroll = { curentPage in
//                self.currentPage = curentPage
//            }
//            self.stepTargetCellDataSource?.onDeleteAction = { object in
//                self.selectedRowStepsTargetObj = object
//            }
        }
    }
    var targetsArray:[Targets]?{
        didSet{
            guard let data = targetsArray else {
                return
            }
            self.stepTargetCellDataSource  = HomeDataSource(data: data, pSize: self.pageSize,collectionView: self.collectionView, stepsTarget: stepsTaken!, activate: { target in
                self.updateTargetState(target: target)
            })
            DispatchQueue.main.async {
                self.collectionView.dataSource = self.stepTargetCellDataSource
                self.collectionView.delegate   = self.stepTargetCellDataSource
                self.collectionView.reloadData()
            }
            self.stepTargetCellDataSource?.onScroll = { curentPage in
                self.currentPage = curentPage
            }
            self.stepTargetCellDataSource?.onDeleteAction = { object in
                self.selectedRowStepsTargetObj = object
            }
        }
        
    }
    var currentPage: Int = 0 {
        didSet {
            if currentPage < self.targetsArray?.count ?? 0 {
            let obj = self.targetsArray?[self.currentPage]
//            self.targetLabel.text = kTarget + ": " + "\(obj?.target ?? 0)"
             //   self.infoLbl.text = kStepsTaken + ": " + "\(stepsTaken?.stepsTaken ?? 0)"
       //     self.dateLabel.text = kDate + ": " + "\(String(describing: obj?.identifire))"
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
        
        self.currentPage = 0
        self.addObserver()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.fetchData()
    }
}
