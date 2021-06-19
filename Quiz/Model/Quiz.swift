//
//  Quiz.swift
//  Quiz
//
//  Created by Kartal Emre Buruk on 19.06.2021.
//

import Foundation

struct Quiz
{
    let question: String
    let options: [String]
    let answer: Int
    
    init(question: String, options: [String], answer: Int)
    {
        self.question = question
        self.options = options
        self.answer = answer
    }
}
