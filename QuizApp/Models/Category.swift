//
//  Category.swift
//  QuizApp
//
//  Created by five on 10/05/2020.
//  Copyright © 2020 karlo lochert. All rights reserved.
//

import Foundation

enum Category{
    case sports(String)
    case science(String)
    init(string: String) {
        switch string {
        case "SPORTS": self = .sports(string)
        default: self = .science(string)
        }
    }
    var text: String {
        switch self {
        case .sports:
            return "SPORTS"
        case .science:
            return "SCIENCE"
        }
    }
}
