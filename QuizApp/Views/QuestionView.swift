//
//  QuestionView.swift
//  QuizApp
//
//  Created by five on 11/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation
import UIKit

class QuestionView: UIView {
    let question:Question
    @IBOutlet var questionView: UIView!
    @IBOutlet weak var questionFIeld: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    init(frame: CGRect,question:Question) {
        self.question = question
        super.init(frame: frame)
        Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)
        addSubview(questionView)
        questionView.frame=self.bounds
        questionView.autoresizingMask=[.flexibleHeight,.flexibleWidth]
    }
    // Ovaj init se poziva kada se CustomView inicijalizira iz .xib datoteke
       required init?(coder aDecoder: NSCoder) {
        question=Question(id:1,question: "da",correctAnswer:0)
           super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)
        addSubview(questionView)
        questionView.frame=self.bounds
        questionView.autoresizingMask=[.flexibleHeight,.flexibleWidth]

           
       }
}
