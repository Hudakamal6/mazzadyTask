//
//  ProductEntity.swift
//  mazzadyInterViewTask
//
//  Created by yearex on 27/04/2025.
//

import Foundation

struct ProductEntity {
    let id: Int
    let name: String
    let image: String
    let price: Double
    let currency: String
    let offer: Double?
    let endDate: Double?
    
    func getTimeRemaining() -> (days: Int, hours: Int, minutes: Int, seconds: Int)? {
        guard let endDate = self.endDate else { return nil }
        
        let totalSeconds = max(0, endDate)

        let days = Int(totalSeconds / 86400)
        let remainingAfterDays = totalSeconds.truncatingRemainder(dividingBy: 86400)
        
        let hours = Int(remainingAfterDays / 3600)
        let remainingAfterHours = remainingAfterDays.truncatingRemainder(dividingBy: 3600)
        
        let minutes = Int(remainingAfterHours / 60)
        let seconds = Int(remainingAfterHours.truncatingRemainder(dividingBy: 60))
        
        return (days, hours, minutes, seconds)
    }
}
