//
//  TargetsData.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 02/02/22.
//
import UIKit

class TargetsData: NSObject {
    var stepsData: [Targets]?
    var onDeleteAction:((Targets)->())?
    var onEditPress:((Targets)->())?
    init(data:[Targets]) {
        self.stepsData = data
    }
}
extension TargetsData : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.stepsData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ManageTargetTableViewCell.self)) as? ManageTargetTableViewCell {
            cell.targetSteps.text = String(describing: stepsData![indexPath.row].steps)
            cell.targetSteps.textColor = stepsData![indexPath.row].isActive ? .orange : .black
            cell.targetTitle.text = stepsData![indexPath.row].name
            cell.editButton.isHidden = Helper.getEditable()
            cell.editButton.setTitle("", for: .normal)
            cell.onEditPress = { _ in
                if let obj = self.stepsData?[indexPath.row] {
                self.onEditPress!(obj)
                }
            }
            return cell
        }
        return UITableViewCell()
    }
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if let obj = self.stepsData?[indexPath.row] {
            self.onDeleteAction!(obj)
            }
        }
    }
}

extension TargetsData: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
}

extension Targets {
}
