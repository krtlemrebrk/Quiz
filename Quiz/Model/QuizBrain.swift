//
//  QuizBrain.swift
//  Quiz
//
//  Created by Kartal Emre Buruk on 19.06.2021.
//

import Foundation

struct QuizBrain
{
    let quizQuestions = [Quiz(question: "What was the first movie in the Marvel Cinematic Universe?",
                              options: ["Captain America",
                                        "The Avengers",
                                        "Iron Man",
                                        "Spider-Man"],
                              answer: 2),
                         Quiz(question: "Which of these is NOT an infinity stone?",
                              options: ["Love",
                                        "Reality",
                                        "Space",
                                        "Time"],
                              answer: 0),
                         Quiz(question: "What is Captain America's shield made out of?",
                              options: ["Gravitonium",
                                        "Vibranium",
                                        "Adamantium",
                                        "Scabrite"],
                              answer: 1),
                         Quiz(question: "What country are Scarlet Witch and Quicksilver from?",
                              options: ["Wakanda",
                                        "Sokovia",
                                        "Krakoa",
                                        "Symkaria"],
                              answer: 1),
                         Quiz(question: "What is Tony Stark's dad's name?",
                              options: ["Anthony",
                                        "Steve",
                                        "Howard",
                                        "Edwin"],
                              answer: 2),
                         Quiz(question: "Who is Hawkeye married to?",
                              options: ["Natasha",
                                        "Wanda",
                                        "Bobbi",
                                        "Laura"],
                              answer: 3),
    ]
    
    var currentQuestion = 0
    var score = 0
    
    func getQuestion() -> Quiz
    {
        return quizQuestions[currentQuestion]
    }
    
    func getScore() -> Int
    {
        return score
    }
    
    func getPercentage() -> Float
    {
        return Float(currentQuestion + 1) / Float(quizQuestions.count)
    }
    
    mutating func checkAnswer(a: Int) -> Bool
    {
        if quizQuestions[currentQuestion].answer == a
        {
            score += 1
            nextQuestion()
            return true
        }
        else
        {
            nextQuestion()
            return false
        }
    }
    
    mutating func nextQuestion()
    {
        if currentQuestion + 1 < quizQuestions.count
        {
            currentQuestion += 1
        }
    }
    
    mutating func reset()
    {
        currentQuestion = 0
        score = 0
    }
}
