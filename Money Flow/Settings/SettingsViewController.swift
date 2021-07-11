//
//  SettingsViewController.swift
//  Money Flow
//
//  Created by Руслан on 04.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var gearImage: UIImageView!
    
    @IBOutlet weak var limitbutton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        limitbutton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
    }

    @IBAction func goToLimits(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(identifier: "LimitsViewController") as? LimitsViewController ?? LimitsViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    @IBAction func deleteAll(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Вы уверены?", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Нет", style: .cancel) { _ in

        }

        let acceptAction = UIAlertAction(title: "Да", style: .default) { _ in
            DataBase.deleteAllData()
        }

        alert.addAction(cancelAction)
        alert.addAction(acceptAction)

        self.present(alert, animated: true, completion: nil)
    }
    
}
