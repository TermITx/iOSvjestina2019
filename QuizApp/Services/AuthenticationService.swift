//
//  AuthenticationService.swift
//  QuizApp
//
//  Created by five on 10/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation

class AuthenticationService{
    func sendLoginRequest(urlString: String, jsonData:[String:Any])->Bool{
        if let url = URL(string: urlString) {
            var request = URLRequest(url:url)
            request.httpMethod="POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            let json = try? JSONSerialization.data(withJSONObject: jsonData)
            request.httpBody=json
            var out:Bool
            out = false
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                        print("error: \(error)")
                }else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                        if (response.statusCode >= 200 && response.statusCode<300){
                            print("Tu sem")
                            out=true
                        }
                        
                        
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print("data: \(dataString)")
                    }
                }
            }
            task.resume()
            print(out)
            return out
        }
        return false
    }
}
