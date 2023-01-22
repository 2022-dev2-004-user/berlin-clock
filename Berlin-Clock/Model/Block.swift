//
//  Block.swift
//  Berlin-Clock
//
//  Created by Daniel Caccia on 22/01/2023.
//

import Foundation

enum Block {
    /// Accepts an `Int` from 1 to 4 describing how many lamps will be ON.
    case sigleMinunteBlock(Int)
    /// Accepts an `Int` from 1 to 11 describing how many lamps will be ON.
    case fiveMinutesBlock(Int)
    /// Accepts an `Int` from 1 to 4 describing how many lamps will be ON.
    case sigleHourBlock(Int)
    /// Accepts an `Int` from 1 to 4 describing how many lamps will be ON.
    case fiveHoursBlock(Int)
    /// Accepts an `Bool` describing if lamps is wether ON or OFF.
    case secondsBlock(Bool)
}
