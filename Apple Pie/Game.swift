//
//  Game.swift
//  Apple Pie
//
//  Created by cmh-bstudent on 11/15/22.
//

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var correctLetters = ""
        for char in word {
            if guessedLetters.contains(char) {
                correctLetters += "\(char)"
            } else {
                correctLetters += "_"
            }
        }
        return correctLetters
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
}
