//
//  ViewController.swift
//  RPS
//
//  Created by Dimon on 04.04.2020.
//  Copyright © 2020 Dimon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainLable.alpha = 0.0
        playAgainLable.layer.cornerRadius = 10
    }
    
    @IBOutlet weak var opponentTurnLable: UILabel!
    @IBOutlet weak var gameStateLable: UILabel!
    @IBOutlet weak var myTurnButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainLable: UIButton!
    
    private var buttons: [UIButton] {
        return [rockButton, myTurnButton, scissorsButton]
    }
    
    private func button(for sign: Sign) -> UIButton {
        switch sign {
        case .rock: return rockButton
        case .paper: return myTurnButton
        case .scissors: return scissorsButton
        }
    }
    
    @IBAction func rockButton(_ sender: Any) {
        updateGameState(.rock)
    }
    
    @IBAction func paperButton(_ sender: Any) {
        updateGameState(.paper)
    }
    
    @IBAction func scissorsButton(_ sender: Any) {
        updateGameState(.scissors)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            self.buttons.forEach {
                $0.isHidden = false
                $0.alpha = 1.0
            }
            
            self.playAgainLable.alpha = 0.0
            
            self.view.backgroundColor = .systemGray
        }
        
        gameStateLable.text = GameState.start.showGameState()
        opponentTurnLable.text = "🤖"
        buttons.forEach { $0.isEnabled = true }
    }
    
    func updateGameState(_ sign: Sign) {
        let opponentTurn = Sign.random
        let currentGameState = sign.beats(opponentTurn)
        let myTurnButton = button(for: sign)
        let otherButtons = buttons.filter { $0 !== myTurnButton }
        
        let backgroundColor: UIColor
        switch currentGameState {
        case .win:
            backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        case .lose:
            backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        default:
            backgroundColor = .systemGray
        }
        
        UIView.animate(withDuration: CATransaction.animationDuration()) {
            otherButtons.forEach {
                $0.isHidden = true
                $0.alpha = 0.0
            }
            
            self.playAgainLable.alpha = 1.0
            
            self.view.backgroundColor = backgroundColor
        }
        
        gameStateLable.text = currentGameState.showGameState()
        opponentTurnLable.text = opponentTurn.sign
        myTurnButton.isEnabled = false
    }
}

