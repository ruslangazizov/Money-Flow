//
//  DataBase.swift
//  Money Flow
//
//  Created by Руслан on 07.07.2021.
//

import Foundation
import UIKit

class DataBase {
    
    private static let userDefaults = UserDefaults.standard
    
    private static var totalIncome: CGFloat = 0.0
    private static var totalExpenses: CGFloat = 0.0
    private static var limitsDictionary: [String: Int] = [:]
    private static var incomeTransactions: [IncomeInfo] = []
    private static var expensesTransactions: [ExpenseInfo] = []
    
    static func save() {
        if let encoded = try? JSONEncoder().encode(DataBase.incomeTransactions) {
            userDefaults.set(encoded, forKey: "incomeTransactions")
        }
        if let encoded = try? JSONEncoder().encode(DataBase.expensesTransactions) {
            userDefaults.set(encoded, forKey: "expensesTransactions")
        }
        userDefaults.set(totalIncome, forKey: "totalIncome")
        userDefaults.set(totalExpenses, forKey: "totalExpenses")
        userDefaults.set(limitsDictionary, forKey: "limitsDictionary")
    }
    
    static func check() {
        let limitsDictionaryIsPresent = userDefaults.dictionary(forKey: "limitsDictionary") != nil
        if userDefaults.float(forKey: "totalIncome") == 0.0 && userDefaults.float(forKey: "totalExpenses") == 0.0 && !limitsDictionaryIsPresent {
            userDefaults.set(0.0, forKey: "totalIncome")
            userDefaults.set(0.0, forKey: "totalExpenses")
            userDefaults.set([String: Int](), forKey: "limitsDictionary")
        } else {
            totalIncome = CGFloat(userDefaults.float(forKey: "totalIncome"))
            totalExpenses = CGFloat(userDefaults.float(forKey: "totalExpenses"))
            limitsDictionary = userDefaults.dictionary(forKey: "limitsDictionary") as? [String: Int] ?? [String: Int]()
            if let data = userDefaults.data(forKey: "incomeTransactions") {
                if let decoded = try? JSONDecoder().decode([IncomeInfo].self, from: data) {
                    incomeTransactions = decoded
                }
            }
            if let data = userDefaults.data(forKey: "expensesTransactions") {
                if let decoded = try? JSONDecoder().decode([ExpenseInfo].self, from: data) {
                    expensesTransactions = decoded
                }
            }
        }
    }
    
    static func getTotalIncome() -> CGFloat {
        check()
        return totalIncome
    }
    
    static func getTotalExpenses() -> CGFloat {
        check()
        return totalExpenses
    }
    
    static func getLimitIn(category: String) -> Int? {
        check()
        return limitsDictionary[category]
    }
    
    static func addIncome(_ income: IncomeInfo) {
        check()
        totalIncome += income.worth
        incomeTransactions.append(income)
        save()
    }
    
    static func addExpense(_ expense: ExpenseInfo) {
        check()
        totalExpenses += expense.cost
        expensesTransactions.append(expense)
        save()
    }
    
    static func addLimitIn(category: String, _ value: Int) {
        check()
        let limit = limitsDictionary[category] ?? 0
        limitsDictionary[category] = limit + value
        save()
    }
    
    static func getTotalExpensesIn(category: String) -> CGFloat {
        check()
        var totalExpenseInCategory: CGFloat = 0
        for transaction in expensesTransactions {
            if transaction.categoryName == category {
                totalExpenseInCategory += transaction.cost
            }
        }
        return totalExpenseInCategory
    }
    
    static func getExpensesArrayIn(category: String) -> [ExpenseInfo] {
        check()
        var expensesArrayInCategory: [ExpenseInfo] = []
        for transaction in expensesTransactions {
            if transaction.categoryName == category {
                expensesArrayInCategory.append(transaction)
            }
        }
        return expensesArrayInCategory
    }
    
    static func getIncomeArray() -> [IncomeInfo] {
        check()
        return incomeTransactions
    }
    
    static func deleteAllData() {
        check()
        totalIncome = 0.0
        totalExpenses = 0.0
        incomeTransactions.removeAll()
        expensesTransactions.removeAll()
        limitsDictionary.removeAll()
        save()
    }
    
    static func getMonthExpensesIn(month: String) -> CGFloat {
        check()
        var totalExpensesInMonth: CGFloat = 0
        for transaction in expensesTransactions {
            if transaction.date.range(of: "." + month + ".") != nil {
                totalExpensesInMonth += transaction.cost
            }
        }
        return totalExpensesInMonth
    }
    
    static func getMonthExpensesInCategory(_ categoryName: String, month: String) -> CGFloat {
        check()
        var totalExpenses: CGFloat = 0
        for transaction in expensesTransactions {
            if transaction.date.range(of: "." + month + ".") != nil {
                if transaction.categoryName == categoryName {
                    totalExpenses += transaction.cost
                }
            }
        }
        return totalExpenses
    }
    
}

struct ExpenseInfo: Decodable, Encodable {
    let categoryName: String
    let name: String
    let date: String //#warning: формат: ДД.ММ.ГГГГ
    let icon: String
    let cost: CGFloat
    
    func getPrettyStringForCost() -> String {
        let costArray = Array(String(Int(cost)))
        var prettyString = ""
        for (i, digit) in costArray.reversed().enumerated() {
            prettyString = String(digit) + prettyString
            if i % 3 == 2 {
                prettyString = "," + prettyString
            }
        }
        if prettyString.starts(with: ",") {
            prettyString.removeFirst()
        }
        return "$" + prettyString
    }
}

struct IncomeInfo: Decodable, Encodable {
    let source: String
    let date: String //#warning: формат: ДД.ММ.ГГГГ
    let icon: String
    let worth: CGFloat
    
    func getPrettyStringForWorth() -> String {
        let costArray = Array(String(Int(worth)))
        var prettyString = ""
        for (i, digit) in costArray.reversed().enumerated() {
            prettyString = String(digit) + prettyString
            if i % 3 == 2 {
                prettyString = "," + prettyString
            }
        }
        if prettyString.starts(with: ",") {
            prettyString.removeFirst()
        }
        return "$" + prettyString
    }
}

