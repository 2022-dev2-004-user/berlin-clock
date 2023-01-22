//
//  BerlinClockViewModel.swift
//  Berlin-Clock
//
//  Created by Daniel Caccia on 22/01/2023.
//

import Foundation

class BerlinClockViewModel {
    var singleMinuteBlocks: Int = 0
    var fiveMinuteBlocks: Int = 0
    var singleHourBlocks: Int = 0
    var fiveHoursBlocks: Int = 0
    var secondsBlock: Bool = false
    
    func generateClock() {
        let now = Date()
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.dateFormat = "hh:MM:ss"
        
        let currentTime = dateFormatter.string(from: now)
        let minutes = calendar.component(.minute, from: now)
        let hours = calendar.component(.hour, from: now)
        let seconds = calendar.component(.second, from: now)
        
        setMinuteBlocks(for: minutes)
        setHourBlocks(for: hours)
        setSecondsBlock(for: seconds)
    }
    
    private func setMinuteBlocks(for minutes: Int) {
        switch minutes % 10 {
        case 1, 6:
            singleMinuteBlocks = 1
        case 2, 7:
            singleMinuteBlocks = 2
        case 3, 8:
            singleMinuteBlocks = 3
        case 4, 9:
            singleMinuteBlocks = 4
        default:
            singleMinuteBlocks = 0
        }
        
        switch minutes / 10 {
        case _ where minutes < 5:
            fiveMinuteBlocks = 0
        case _ where minutes < 10:
            fiveMinuteBlocks = 1
        case _ where minutes < 15:
            fiveMinuteBlocks = 2
        case _ where minutes < 20:
            fiveMinuteBlocks = 3
        case _ where minutes < 25:
            fiveMinuteBlocks = 4
        case _ where minutes < 30:
            fiveMinuteBlocks = 5
        case _ where minutes < 35:
            fiveMinuteBlocks = 6
        case _ where minutes < 40:
            fiveMinuteBlocks = 7
        case _ where minutes < 45:
            fiveMinuteBlocks = 8
        case _ where minutes < 50:
            fiveMinuteBlocks = 9
        case _ where minutes < 55:
            fiveMinuteBlocks = 10
        default:
            fiveMinuteBlocks = 11
        }
    }
    
    private func setHourBlocks(for hours: Int) {
        switch hours % 10 {
        case 1, 6:
            singleMinuteBlocks = 1
        case 2, 7:
            singleMinuteBlocks = 2
        case 3, 8:
            singleMinuteBlocks = 3
        case 4, 9:
            singleMinuteBlocks = 4
        default:
            singleMinuteBlocks = 0
        }
        
        switch hours {
        case _ where hours < 5:
            fiveHoursBlocks = 0
        case _ where hours < 10:
            fiveHoursBlocks = 1
        case _ where hours < 15:
            fiveHoursBlocks = 2
        case _ where hours < 20:
            fiveHoursBlocks = 3
        default:
            fiveMinuteBlocks = 4
        }
    }
    
    private func setSecondsBlock(for seconds: Int) {
        secondsBlock = seconds % 2 == 0
    }
}
