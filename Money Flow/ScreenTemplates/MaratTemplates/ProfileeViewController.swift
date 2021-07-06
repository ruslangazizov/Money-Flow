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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panelView.layer.cornerRadius = 35
        behindButtonView.layer.cornerRadius = 20
        behindButtonView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        behindButtonView.layer.borderWidth = 3

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getReportButtonAction(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
