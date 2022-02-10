//
//  HistoricalDataViewController+DBHelper.swift
//  FitMeApp
//
//  Created by ASPL on 04/02/22.
//

import Foundation

extension HistoricalDataViewController {
    func fetchHistoricalTargets(date:Date)  {
        let filter = Helper.bigDateString(date: date)
        let predicate = NSPredicate(format: "dateStamp == %@", filter)
        CoreDataHelper.shared.fetchRecord(entity: Historical.self, predicate: predicate) { result in
            if result.count > 0 {
            if let results = result as? [Historical] {
                self.items = results
                fetchStepsDateWise(date: Date())
            }
            }
            else {
                self.items?.removeAll()
            }
        }
    }
    func fetchStepsDateWise(date:Date){
        let filter = Helper.bigDateString(date: date)
        let predicate = NSPredicate(format: "dateStamp == %@", filter)
        CoreDataHelper.shared.fetchRecord(entity: StepsTarget.self, predicate: predicate) { result in
            if result.count > 0 {
                if let itms = result as? [StepsTarget] {
                    print(itms[0].stepsTaken)
                }
            }
        }
    }
}
