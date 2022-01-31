//
//  DateExtension.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//

import Foundation

extension Date {
    static var currentTimeStamp: Int64{
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}
