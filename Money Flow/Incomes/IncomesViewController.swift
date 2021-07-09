//
//  IncomesViewController.swift
//  Money Flow
//
//  Created by Руслан on 04.07.2021.
//

import UIKit

class IncomesViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    private let incomesTableViewCellID = "IncomesTableViewCell"
        
    private var data: [IncomeInfo]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

extension IncomesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: incomesTableViewCellID) as? IncomesTableViewCell ?? IncomesTableViewCell()
        cell.setData(data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}

extension IncomesViewController: UITableViewDelegate {
    
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
