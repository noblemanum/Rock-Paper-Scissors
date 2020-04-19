//
//  GameState.swift
//  RPS
//
//  Created by Dimon on 04.04.2020.
//  Copyright © 2020 Dimon. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    func showGameState() -> String {
        switch self {
        case .start:
            return "Rock, Paper or Scissors?"
        case .draw:
            return "Draw!"
        case .win:
            return "You Win!"
        case .lose:
            return "You Lose!"
        }
    }
}

