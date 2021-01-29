//
//  StartView.swift
//  Shared
//
//  Created by rodrigo on 1/20/21.
//

import SwiftUI

struct StartView: View {
    @State private var isShowingQuestionView = false
    
    var body: some View {
        Button(action: { isShowingQuestionView = true }, label: { Text("Start") })
            .navigate(to: QuestionView(game: Game(), isActive: $isShowingQuestionView), when: $isShowingQuestionView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

