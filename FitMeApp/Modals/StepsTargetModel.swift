//
//  StepsTargetModel.swift
//  FitMeApp
//
//  Created by Pradeep Dahiya on 27/01/22.
//
//
import Foundation
import CoreData

/**
    Enum for Event Entity member fields
*/
enum StepsTargetAttributes: String {
    case
    stepsTaken    = "stepsTaken",
    target        = "target",
    timestamp     = "timestamp"


    static let getAll = [
        stepsTaken,
        target,
        timestamp
    ]
}

//@objc(StepsTarget)
////
/////**
//    The Core Data Model: StepsTargetAttributes

extension StepsTarget {
//
//        @nonobjc public class func newFetchRequest() -> NSFetchRequest<StepsTarget> {
//            return NSFetchRequest<StepsTarget>(entityName: EntityTypes.StepsTargetEntity.rawValue)
//        }

//        @NSManaged public var expiryDate: NSDate?
//        @NSManaged public var number: String?
//        @NSManaged public var ofUser: User?

}
