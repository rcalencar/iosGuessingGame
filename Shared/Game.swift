//
//  Game.swift
//  GuessingGame
//
//  Created by rodrigo on 1/20/21.
//

import SwiftUI
import Combine

class Game: ObservableObject {
    @Published var currentQuestion = rootQuestion
    @Published var gameOver = false
    @Published var computerWin = false
    
    init() {
        rootQuestion.newNoBranch(questionString: "run", guessString: "rabbit")
        let subquestion = rootQuestion.newYesBranch(questionString: "not kill", guessString: "yellow fish")
        subquestion.newYesBranch(questionString: "have a hard-shell", guessString: "turtle")
    }
    
    func play(answer: Bool) {
        if currentQuestion.isAGuess {
            gameOver = true
            computerWin = answer
        } else {
            currentQuestion = answer ? currentQuestion.yes! : currentQuestion.no!
        }
    }
}

let rootQuestion = Question(text: "live in water", yes: Question(text: "shark"), no: Question(text: "monkey"))
