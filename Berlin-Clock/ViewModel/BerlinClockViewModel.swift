//
//  BerlinClockViewModel.swift
//  Berlin-Clock
//
//  Created by Daniel Caccia on 22/01/2023.
//

import Foundation

class BerlinClockViewModel {
    func generateClock() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:MM:ss"
        
        let currentTime = dateFormatter.string(from: now)
    }
    
    private func singleMinuteBlocks() {
        
    }
    
    private func fiveMinuteBlocks() {
        
    }
    
    private func singleHourBlocks() {
        
    }
    
    private func fiveHoursBlocks() {
        
    }
    
    private func secondsBlock() {
        
    }
}
