//
//  QuestionView.swift
//  GuessingGame
//
//  Created by rodrigo on 1/20/21.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var game: Game
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            Text(game.currentQuestion.text)
                .font(.title)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                Button(action: { game.play(answer: true) }, label: {
                    Text("Yes")
                })
                Spacer()
                Button(action: { game.play(answer: false) }, label: {
                    Text("No")
                })
                Spacer()
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            Button(action: { isActive = false }, label: {
                Text("Cancel")
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
        .navigate(to: ResultView(game: game), when: $game.gameOver)

    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(game: Game(), isActive: .constant(false))
    }
}
