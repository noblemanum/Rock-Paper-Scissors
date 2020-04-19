//
//  Sign.swift
//  RPS
//
//  Created by Dimon on 04.04.2020.
//  Copyright © 2020 Dimon. All rights reserved.
//

import Foundation

enum Sign: Int {
    
    case rock, paper, scissors
    
    static var random: Sign {
        return Sign(rawValue: Int.random(in: 0...2)) ?? .scissors
    }
    
    var sign: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissors: return "✌️"
        }
    }
        
     func beats(_ opponentTurn: Sign) -> GameState {
        guard self != opponentTurn else {
            return .draw
        }
        
        switch self {
        case .rock:
            if opponentTurn == .scissors {
                return .win
            } else {
                return .lose
            }
        case .paper:
            if opponentTurn == .rock {
                return .win
            } else {
                return .lose
            }
        case .scissors:
            if opponentTurn == .paper {
                return .win
            } else {
                return .lose
            }
        }
     }
    
}
