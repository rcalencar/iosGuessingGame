//
//  ResultView.swift
//  GuessingGame
//
//  Created by rodrigo on 1/20/21.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var game: Game
    @State private var playAgain = false

    var body: some View {
        VStack {
            if game.computerWin {
                Text("I win!")
            } else {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("What was the animal that you thought about?")
                })
            }
            Button(action: { playAgain = true }, label: {
                Text("Play again.")
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            })
        }
        .navigate(to: StartView(), when: $playAgain)
    }
}

let g = Game()

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        g.computerWin = true
        
        return ResultView(game: g)
    }
}
