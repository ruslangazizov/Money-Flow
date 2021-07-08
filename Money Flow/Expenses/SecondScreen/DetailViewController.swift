//
//  CategoryViewController.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 05.07.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    private let detailTableViewCellID = "DetailTableViewCell"
    var backgroundColor: UIColor!
    var categoryName: String! {
        didSet {
            data = DataBase.getExpensesArrayIn(category: categoryName)
        }
    }
    
    private var data: [ExpenseInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        categoryLabel.text = categoryName
        mainView.backgroundColor = backgroundColor
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
        valueLabel.text = String(Float(DataBase.getTotalExpensesIn(category: categoryName)))
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: categoryName, style: .plain, target: nil, action: nil)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let addScreenViewController = storyboard?.instantiateViewController(identifier: "AddScreenViewController") as? AddScreenViewController ?? AddScreenViewController()
        addScreenViewController.backgroundColor = backgroundColor
        addScreenViewController.categoryName = categoryLabel.text
        addScreenViewController.delegate = self
        navigationController?.pushViewController(addScreenViewController, animated: true)
    }
    
    func reloadData() {
        valueLabel.text = String(Float(DataBase.getTotalExpensesIn(category: categoryName)))
        data = DataBase.getExpensesArrayIn(category: categoryName)
        tableView.reloadData()
    }
    
}

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: detailTableViewCellID) as? DetailTableViewCell ?? DetailTableViewCell()
        cell.setData(data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
}

extension DetailViewController: UITableViewDelegate {
    
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
