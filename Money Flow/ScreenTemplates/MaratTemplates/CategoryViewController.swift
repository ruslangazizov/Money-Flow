//
//  CategoryViewController.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 05.07.2021.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    private let categoryTableViewCellID = "CategoryTableViewCell"
    
    private let tempData: [ExpenseInfo] = [
        ExpenseInfo(name: "Новые шины", date: "21.05.2020", icon: "⚙️", cost: 1200),
        ExpenseInfo(name: "Автомойка", date: "21.05.2020", icon: "🚿", cost: 15),
        ExpenseInfo(name: "Автосервис", date: "21.05.2020", icon: "🛠", cost: 900)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
    }
    
}

struct ExpenseInfo {
    let name: String
    let date: String //#warning: как хранить дату?
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

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

