//
//  IncomesViewController.swift
//  Money Flow
//
//  Created by Руслан on 04.07.2021.
//

import UIKit

class GoalsViewController: UIViewController {

//    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    private let TableViewCellID = "TableViewCell"
        
    private var data: [IncomeInfo] = GoalsContainer.getArray()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panelView.layer.cornerRadius = 20
        panelView.alpha = 0.95
        panelView.dropShadow()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        valueLabel.text = String(Float(DataBase.getTotalIncome()))
        data = GoalsContainer.getArray()
        
    }
        
    @IBAction func addButtonAction(_ sender: Any) {
        let addScreenViewController = storyboard?.instantiateViewController(identifier: "GoalsAddScreenViewController") as? GoalsAddScreenViewController ?? GoalsAddScreenViewController()
        
        addScreenViewController.delegate = self
        
        navigationController?.pushViewController(addScreenViewController, animated: true)
    }
    
    func reloadData() {
//        valueLabel.text = String(Float(DataBase.getTotalIncome()))
        data = GoalsContainer.getArray()
        tableView.reloadData()
    }

}

extension GoalsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellID) as? TableViewCell ?? TableViewCell()
  
        cell.setData(data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}

extension GoalsViewController: UITableViewDelegate {
    
}
