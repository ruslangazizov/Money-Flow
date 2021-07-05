//
//  ProfileViewController.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 05.07.2021.
//

import UIKit

class ProfileeViewController: UIViewController {
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var statisticsButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        panelView.layer.cornerRadius = 35

        // Do any additional setup after loading the view.
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
