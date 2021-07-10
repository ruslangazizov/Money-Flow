//
//  GoalsContainer.swift
//  Money Flow
//
//  Created by Марат Гатин on 10.07.2021.
//

import Foundation
import UIKit

class GoalsContainer {
    private static let userDefaults = UserDefaults.standard
    private static var goalsArray: [IncomeInfo] = []

    static func add (element:IncomeInfo){
        goalsArray.append( element)

    }
    static func save() {
        if let encoded = try? JSONEncoder().encode(GoalsContainer.goalsArray) {
                userDefaults.set(encoded, forKey: "goalsArray")
            }
        }
    static func getArray() -> [IncomeInfo]{
        return goalsArray
    }
}



