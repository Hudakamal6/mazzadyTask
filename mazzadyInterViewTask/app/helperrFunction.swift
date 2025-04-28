////
////  helperrFunction.swift
////  mazzadyInterViewTask
////
////  Created by yearex on 28/04/2025.
////
//
//import Foundation
//class HelperFunction {
//    static func convertEndDateToTimeRemaining(endDate: String) -> String {
//        let currentTime = Date()
//        let endDateTime = Date(timeIntervalSince1970: endDate)
//
//        // Calculate the time interval between the current time and end date
//        let timeInterval = endDateTime.timeIntervalSince(currentTime)
//
//     
//
//        // Convert the time interval into days, hours, and minutes
//        let days = Int(timeInterval) / (60 * 60 * 24)
//        let hours = (Int(timeInterval) % (60 * 60 * 24)) / (60 * 60)
//        let minutes = (Int(timeInterval) % (60 * 60)) / 60
//
//        return "\(days) days, \(hours) hours, \(minutes) minutes"
//    }
//}
