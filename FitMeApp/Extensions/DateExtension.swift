//
//  DateExtension.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//

import Foundation

extension Date {
    static var currentTimeStamp: String{
        return String(Date().timeIntervalSince1970 * 1000)
    }
}
