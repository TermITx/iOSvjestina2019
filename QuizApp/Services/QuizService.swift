//
//  QuizService.swift
//  QuizApp
//
//  Created by five on 10/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation

class QuizService{
    func fetchQuizes(urlString: String, completion: @escaping (([Quiz]?) -> Void)) {
        //var quizes: [Quiz]
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            // URLRequest izmedu ostalog ima HTTP header-e
            // ovdje u ovaj request postavljamo jos jedan HTTPHEader i to 'X-RapidAPI-Key', server koji prima ovaj request koristi ovaj parametar header-a da bi autentificirao request
            request.addValue("225b3ddf80msha350534f81c8c4cp1c0858jsn2a5d1107aad8", forHTTPHeaderField: "X-RapidAPI-Key")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    
                    // Ovdje, za razliku od FlagService-a stvaramo json, a ne sliku, jer je 'data' objekt zapravo json
                    do {
                        // staticka metoda 'jsonObject' prima 'data' objekt i ako je taj niz byteova json stvara jedan json objekt.
                        // kljucna rijec 'try' znaci da ta metoda moze baciti iznimku u slucaju da 'data' nije json
                        // tu iznimku hvatamo i u 'catch' bloku rukujemo greskom, u ovom slucaju pozivamo 'completion' blok koda sa 'nil'
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        // iz 'json' objekta mozemo stvoriti 'country' objekt u kojem smo definirali 'init' koji prima json
                        // json je 'Any' tip, ali on zapravo moze biti ili dictionary ili array
                        // pogledajte u Country razredu rukovanje json-om ili na dokumentaciji: https://developer.apple.com/swift/blog/?id=37
                        var finalArray:[Quiz?] = []
                        if let dict = json as? [String: Any],
                            let quizes = dict["quizzes"] as? [Any]{
                            //print(dict["quizzes"])
                            //print(quizes)
                            //let quiz = dict["quizzes"]
                            var quiz:Quiz?
                            for i in quizes{
                                
                                //print(i)
                                if let dict2 = i as? [String: Any]{
                                    quiz = Quiz(json:i)
                                    finalArray.append(quiz)
                                }
                            }
                            
                        }
                        
                        //print(json)
                        //let country = Quiz(json: json)
                        if let test = finalArray as? [Quiz]{
                            completion(test)

                        }
                    } catch {
                        completion(nil)
                    }
                    
                    
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }

    }
    
}
