//
//  ViewController.swift
//  QuizApp
//
//  Created by five on 08/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func SignIn(_ sender: UIButton) {
        if (sender.tag == 0){
            if (usernameField.text == "Termitx" && passwordField.text == "Lozinka"){
                print ("Successful sign in!")
            }else{
                print("Wrong username or password!")
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

