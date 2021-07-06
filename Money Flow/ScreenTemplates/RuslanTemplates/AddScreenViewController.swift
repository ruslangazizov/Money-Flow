//
//  AddScreenViewController.swift
//  
//
//  Created by Руслан on 05.07.2021.
//

import UIKit

class AddScreenViewController: UIViewController {
    
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func dropdownButtonAction(_ sender: Any) {
        guard let popupScreenViewController = storyboard?.instantiateViewController(withIdentifier: "PopupCollectionViewController") as? PopupCollectionViewController else { return }
        
        popupScreenViewController.delegate = self
//        popupScreenViewController.dataSource = self
        present(popupScreenViewController, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
    }
    
    func updateChoiceWith(_ choice: String) {
        choiceTextField.text = choice
    }
}
