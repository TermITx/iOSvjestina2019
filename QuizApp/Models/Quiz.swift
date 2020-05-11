//
//  Quiz.swift
//  QuizApp
//
//  Created by five on 10/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation

class Quiz{
    let id: Int
    let title: String
    let description: String
    let category: Category
    let level: Int
    let image: String
    let questions: [Question]
    
    init?(json: Any) {
        if let jsonDict = json as? [String: Any],
            let id = jsonDict["id"] as? Int,
            let title = jsonDict["title"] as? String,
            let description = jsonDict["description"] as? String,
            let category = jsonDict["category"] as? String,
            let level = jsonDict["level"] as? Int,
            let image = jsonDict["image"] as? String,
            let questions = jsonDict["questions"] as? [Any]
            {
                self.id = id
                self.title = title
                self.description = description
                self.category = Category.init(string: category)
                self.level = level
                self.image = image
                var pom = [Question]()
                for i in questions{
                    if let jsonDict2 = i as? [String: Any],
                        let id2 = jsonDict2["id"] as? Int,
                        let question = jsonDict2["question"] as? String,
                        let answers = jsonDict2["answers"] as? [String],
                    let correctAnswer = jsonDict2["correct_answer"] as? Int{
                        pom.append(Question(id: id2, question: question,answers:answers, correctAnswer: correctAnswer))
                    }
                }
                self.questions = pom
        }


        else {
            return nil
        }
    }


}
