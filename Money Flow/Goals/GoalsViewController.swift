//
//  IncomesViewController.swift
//  Money Flow
//
//  Created by Руслан on 04.07.2021.
//

import UIKit

class GoalsViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    private let TableViewCellID = "TableViewCell"
        
    private var data: [IncomeInfo] = GoalsContainer.getArray()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GoalsContainer.add(element: IncomeInfo(source: "Hi", date: "11.11.2011", icon: "😃", worth: 5000))
        
        panelView.layer.cornerRadius = 20
        panelView.alpha = 0.95
        panelView.dropShadow()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        valueLabel.text = String(Float(DataBase.getTotalIncome()))
        data = DataBase.getIncomeArray()
    }
        
    @IBAction func addButtonAction(_ sender: Any) {
        let addScreenViewController = storyboard?.instantiateViewController(identifier: "AddScreenViewController") as? AddScreenViewController ?? AddScreenViewController()
        
        addScreenViewController.delegate = self
        
        navigationController?.pushViewController(addScreenViewController, animated: true)
    }
    
    func reloadData() {
        valueLabel.text = String(Float(DataBase.getTotalIncome()))
        data = DataBase.getIncomeArray()
        tableView.reloadData()
    }
        
}

extension GoalsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellID) as? TableViewCell ?? TableViewCell()
        print(data.count)
        
        print(data[indexPath.row].date)
        cell.setData(data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}

extension GoalsViewController: UITableViewDelegate {
    
}

extension UIView {
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}
