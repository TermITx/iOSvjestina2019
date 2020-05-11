//
//  QuizController.swift
//  QuizApp
//
//  Created by five on 10/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation
import UIKit


class QuizController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    var quizService = QuizService()
    
    @IBOutlet weak var funFact: UILabel!
    @IBAction func Dohvati(_ sender: UIButton) {
        if (sender.tag == 3){
            print("Clicked!")
            let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
            quizService.fetchQuizes(urlString: urlString) { (quizzes) in
                       // ovdje moramo izvrsiti ovaj kod na main dretvi, vise o tome u iducim predavanjima
                       DispatchQueue.main.async {
                            //var questions = [Quiz]()
                            var num = 0
                            if let quizzes = quizzes {
                                for i in quizzes{
                                    //print(i.questions)
                                    let prob = i.questions.map({
                                    (val: Question) -> String in
                                        return val.question
                                    })
                                    //print(prob)
                                    let nbas = i.questions.map({
                                    (val: Question) -> String in
                                        return val.question
                                    }).filter { (value) -> Bool in
                                        return value.contains("NBA")}
                                    num+=nbas.count
                                }
                           }
                        self.funFact.isHidden=false
                        self.funFact.text="Fun fact: Word NBA is used " + String(num) + " times in all of the quizes!"
                        
                       }
            }
        }
    }
    
 
    
    

}
