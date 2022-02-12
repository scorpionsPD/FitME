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
            if let results = result as? [Historical] {
                fetchStepsDateWise(date: date, results: results)
            }
            else {
               // self.items?.removeAll()
            }
        }
    }
    func fetchStepsDateWise(date:Date, results:[Historical]){
        let filter = Helper.bigDateString(date: date)
        let predicate = NSPredicate(format: "dateStamp == %@", filter)
        CoreDataHelper.shared.fetchRecord(entity: StepsTarget.self, predicate: predicate) { result in
          //  if result.count > 0 {
                if let itms = result as? [StepsTarget] {
                  //  self.items = results
                    self.historicalData = HistoricalData(targets: results, steps: itms.last)
//                    print(itms[0].stepsTaken)
//                    print(date)
            //    }
            }
        }
    }
}
