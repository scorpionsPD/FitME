//
//  ManageTargetsViewController.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 02/02/22.
//
import CoreData
import UIKit
import MaterialComponents

class ManageTargetsViewController: UIViewController {
    @IBOutlet weak var targetsTable: UITableView!
    
    var floatingButton:MDCFloatingButton!
    
    var selectedRowTargetObj: Targets?{
        didSet {
            guard let _ = selectedRowTargetObj else {
                return
            }
            self.deleteRecordWithDate(rowObject: selectedRowTargetObj!)
        }
    }
    
    var selectedTargetToEdit: Targets?{
        didSet {
            guard let _ = selectedTargetToEdit else {
                return
            }
            self.showAddPopUP(isUpdate: true)
        }
    }
    
    var taargetDataSource:TargetsData?
    
    var targetsArray:[Targets]?{
        didSet{
            guard let data = targetsArray else {
                return
            }
            self.taargetDataSource = TargetsData(data: data)
            self.targetsTable.dataSource = self.taargetDataSource
            self.targetsTable.delegate = self.taargetDataSource
            self.targetsTable.reloadData()
            self.taargetDataSource?.onDeleteAction = {object in
                self.selectedRowTargetObj = object
            }
            self.taargetDataSource?.onEditPress = { object in
                self.selectedTargetToEdit = object
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.setupAddStepsButton()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.fetchTargets()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}


