//
//  Question.swift
//  GuessingGame
//
//  Created by rodrigo on 1/20/21.
//

import Foundation

class Question {
    init(text: String, yes: Question? = nil, no: Question? = nil) {
        self.text = text
        self.yes = yes
        self.no = no
    }
    
    var text: String
    var yes: Question? = nil
    var no: Question? = nil
    
    var isAGuess: Bool {
        return yes == nil
    }
    
    @discardableResult
    func newYesBranch(questionString: String, guessString: String) -> Question {
        let newGuess = Question(text: guessString)
        let newQuestion = Question(text: questionString, yes: newGuess, no: yes)
        yes = newQuestion
        
        return newQuestion
    }

    @discardableResult
    func newNoBranch(questionString: String, guessString: String) -> Question {
        let newGuess = Question(text: guessString)
        let newQuestion = Question(text: questionString, yes: newGuess, no: no)
        no = newQuestion
        
        return newQuestion
    }
}
