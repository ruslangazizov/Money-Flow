//
//  ProfileViewController.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 05.07.2021.
//

import UIKit

class ProfileeViewController: UIViewController {
    
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var behindButtonView: UIView!
    
    private let profileeTableViewCellID = "ProfileeTableViewCell"
    
    private let tempData: [ExpenseInfo] = [
        ExpenseInfo(name: "Новые шины", date: "21.05.2020", icon: "⚙️", cost: 1200),
        ExpenseInfo(name: "Автомойка", date: "21.05.2020", icon: "🚿", cost: 15),
        ExpenseInfo(name: "Автосервис", date: "21.05.2020", icon: "🛠", cost: 900)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        behindButtonView.layer.cornerRadius = 20
        behindButtonView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        behindButtonView.layer.borderWidth = 3
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
    }
    
    @IBAction func getReportButtonAction(_ sender: Any) {
    }

}
