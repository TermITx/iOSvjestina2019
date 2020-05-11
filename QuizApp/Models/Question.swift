//
//  File.swift
//  QuizApp
//
//  Created by five on 10/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation
class Question{
    let id: Int
    let question: String
    let correctAnswer: Int
    
    init(id:Int,question:String,correctAnswer:Int){
        self.id = id
        self.question = question
        self.correctAnswer = correctAnswer
    }
}
