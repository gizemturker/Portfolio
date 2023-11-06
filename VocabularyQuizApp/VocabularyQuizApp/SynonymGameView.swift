//
//  SynonymGameView.swift
//  VocabularyQuizApp
//
//  Created by Gizem Turker on 23.08.2023.
//

import SwiftUI

struct SynonymGameView: View {
    let wordToFind = "Eloquent"
    let options = ["Articulate", "Fluent", "Incoherent", "Proficient"]

    @State private var selectedOption: String?
    @State private var isCorrect: Bool = false

    var body: some View {
        VStack {
            Spacer()

            Text("Word to Find Synonyms For:")
            Text(wordToFind)
                .font(.title)
                .padding()

            Spacer()

            ForEach(options, id: \.self) { option in
                Button(action: {
                    checkAnswer(option)
                }) {
                    Text(option)
                        .frame(width: 150, height: 50)
                        .background(
                            selectedOption == option ?
                            (isCorrect ? Color.green : Color.red) :
                            Color.clear
                        )
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                        .padding(.bottom, 5)
                }
                .disabled(selectedOption != nil)
            }

            Text(isCorrect ? "Correct! 'Eloquent' means articulate and proficient in expressing ideas." : "")
                .foregroundColor(.green)
                .padding()

            Spacer()

            Button("Next Question") {
                resetQuestion()
            }
            .padding()
            .disabled(selectedOption == nil)

            Spacer()
        }
        .padding()
    }

    func checkAnswer(_ option: String) {
        selectedOption = option
        isCorrect = option == "Articulate" || option == "Proficient"
    }

    func resetQuestion() {
        selectedOption = nil
        isCorrect = false
    }
}

struct SynonymGameView_Previews: PreviewProvider {
    static var previews: some View {
        SynonymGameView()
    }
}

