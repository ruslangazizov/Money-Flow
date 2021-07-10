//
//  AddScreenViewController.swift
//  
//
//  Created by Руслан on 05.07.2021.
//

import UIKit

class LimitsViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 15
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
    }

    @IBAction func dropdownButtonAction(_ sender: Any) {
        guard let popupScreenViewController = storyboard?.instantiateViewController(withIdentifier: "PopupScreenViewController") as? PopupScreenViewController else { return }
        
        popupScreenViewController.delegate = self
//        popupScreenViewController.dataSource = self
        present(popupScreenViewController, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func updateChoiceWith(_ choice: String) {
        choiceTextField.text = choice
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
