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
    timestamp     = "timestamp",
    dateStamp = "dateStamp",
    totalSteps = "totalSteps"
    static let getAll = [
        stepsTaken,
        timestamp,
        dateStamp,
        totalSteps
    ]
}

enum TargetsAttributes: String {
    case
    name = "name",
    identifire = "identifire",
    steps = "steps",
    isActive = "isActive"
    
    
    static let getAll = [
        name,
        identifire,
        steps,
        isActive
    ]
}

enum HistoricalAttributes: String {
    case
    name = "name",
    identifire = "identifire",
    steps = "steps",
    isActive = "isActive"
    
    
    static let getAll = [
        name,
        identifire,
        steps,
        isActive
    ]
}

struct SingleTarget {
    var targetSteps:Int?
    var targetName:String?
}
