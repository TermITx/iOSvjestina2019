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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionView: QuestionView!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var errorMsg: UILabel!
    @IBOutlet weak var funFact: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionView.questionFIeld.text="Question"
    }
    var quizService = QuizService()

    @IBAction func Dohvati(_ sender: UIButton) {
        if (sender.tag == 3){
            print("Clicked!")
            let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
            quizService.fetchQuizes(urlString: urlString) { (quizzes) in
                
                       DispatchQueue.main.async {
                            var num = 0
                            if let quizzes = quizzes {
                                for i in quizzes{
                                    let prob = i.questions.map({
                                    (val: Question) -> String in
                                        return val.question
                                    })
                                    let nbas = i.questions.map({
                                    (val: Question) -> String in
                                        return val.question
                                    }).filter { (value) -> Bool in
                                        return value.contains("NBA")}
                                    num+=nbas.count
                                }
                                self.funFact.isHidden=false
                                self.funFact.text="Fun fact: Word NBA is used " + String(num) + " times in all of the quizes!"
                                let title = quizzes[0].title
                                self.titleField.text=title
                                self.titleField.isHidden=false
                                print(quizzes[0].image)
                                //var yourImage: UIImage = UIImage(named: quizzes[0].image)
                                //print(yourImage)
                                //self.imageView.image = yourImage
                                //self.imageView.isHidden=false
                                //self.questionView=QuestionView(frame: cg, question: quizzes[0].questions[0])
                                //var cg = CGRect(x: 50, y: 50, width: 100, height: 100)
                                do {
                                    let url = URL(string: quizzes[0].image)
                                    let data = try Data(contentsOf: url!)
                                    self.imageView.image = UIImage(data: data)
                                    self.imageView.isHidden=false
                                }
                                catch{
                                    print(error)
                                }

                                //self.questionView.questionFIeld.text=quizzes[0].questions[0].question
                                //self.questionView = QuestionView(frame: cg, question: quizzes[0].questions[0])
                                self.questionView.isHidden=false
                                self.questionView.questionFIeld.text=quizzes[0].questions[0].question
                                self.questionView.answer1.setTitle(quizzes[0].questions[0].answers[0], for: .normal)
                                self.questionView.answer2.setTitle(quizzes[0].questions[0].answers[1], for: .normal)
                                self.questionView.answer3.setTitle(quizzes[0].questions[0].answers[2], for: .normal)
                                self.questionView.answer4.setTitle(quizzes[0].questions[0].answers[3], for: .normal)
                                if (quizzes[0].category.text==Category.sports("SPORT").text){
                                    self.imageView.backgroundColor = UIColor.gray
                                    self.titleField.backgroundColor=UIColor.gray
                                }else{
                                    self.imageView.backgroundColor = UIColor.red
                                    self.titleField.backgroundColor=UIColor.red
                                }
                            }else{
                                self.errorMsg.isHidden=false

                        }

                       }
            }
        }
    }
    
 
    
    

}
