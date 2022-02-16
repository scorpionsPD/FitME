//
//  Helper.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 04/02/22.
//

import Foundation

import UIKit

class Helper : NSObject {
    class func isRecordExists(dateA: String, dateB: Date ) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        if dateA == dateFormatter.string(from: dateB) {
            return true
        }
        return false
    }
    class func bigDateString(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
    class func timeString(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    class func getEditable() -> Bool{
        return UserDefaults.standard.bool(forKey: kEditable)
    }
    class func setEditable(value:Bool) {
        UserDefaults.standard.set(value, forKey: kEditable)
        UserDefaults.standard.synchronize()
    }
}



