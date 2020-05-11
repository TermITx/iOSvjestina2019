//
//  ViewController.swift
//  QuizApp
//
//  Created by five on 08/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var authenticationService = AuthenticationService()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func SignIn(_ sender: UIButton) {
        if (sender.tag == 0){
            let jsonData = ["username":usernameField.text,"password":passwordField.text]
            let urlString = "https://iosquiz.herokuapp.com/api/session"
            self.authenticationService.sendLoginRequest(urlString: urlString,jsonData:jsonData){(out) in
                DispatchQueue.main.async {
                    if let out = out{
                        if (out){
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.switchViewControllers()
                            let myViewController = QuizController(nibName: "QuizController", bundle: nil)
                            self.present(myViewController, animated: true, completion: nil)
                        }
                    }
                }
            }
            
        }
    }
    @IBAction func Clear(_ sender: UIButton) {
        if (sender.tag == 1){
            print("Fields cleared")
            usernameField.text = ""
            passwordField.text = ""
        }

    }
}

