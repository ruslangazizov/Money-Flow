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
    
    static var totalIncome: CGFloat = 0
    static var totalExpenses: CGFloat = 0
    static var incomeTransactions: [IncomeInfo] = []
    static var expensesTransactions: [ExpenseInfo] = []
    
    static func save() {
        if let encoded = try? JSONEncoder().encode(DataBase.incomeTransactions) {
            userDefaults.set(encoded, forKey: "transactions")
        }
        if let encoded = try? JSONEncoder().encode(DataBase.expensesTransactions) {
            userDefaults.set(encoded, forKey: "transactions")
        }
    }
    
    static func check() {
        if userDefaults.float(forKey: "totalIncome") == 0 {
            userDefaults.set(0, forKey: "totalIncome")
            userDefaults.set(0, forKey: "totalExpenses")
            save()
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
    
    func getPrettyStringForCost() -> String {
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

