//
//  ExpensesViewController.swift
//  Money Flow
//
//  Created by Руслан on 04.07.2021.
//

import UIKit

class ExpensesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataBase.addExpense(ExpenseInfo(categoryName: "Транспорт", name: "шина", date: "07.07.2021", icon: "⚙️", cost: 500))
        DataBase.addExpense(ExpenseInfo(categoryName: "Транспорт", name: "сервис", date: "01.06.2021", icon: "⚙️", cost: 1000))
        DataBase.addExpense(ExpenseInfo(categoryName: "Шоппинг", name: "футболка", date: "07.07.2021", icon: "👕", cost: 50))
        DataBase.addIncome(IncomeInfo(source: "Работа", date: "07.07.2021", icon: "😀", worth: 2000))
        print(DataBase.getTotalIncome())
        print(DataBase.getTotalExpenses())
        print(DataBase.getMonthExpensesIn(month: "07"))
        print(DataBase.getTotalExpensesIn(category: "Транспорт"))
        print(DataBase.getMonthExpensesInCategory("Транспорт", month: "07"))

    }
    
}
