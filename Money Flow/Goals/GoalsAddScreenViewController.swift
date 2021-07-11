//
//  GoalsAddScreenViewController.swift
//
//
//  Created by Руслан on 05.07.2021.
//
import UIKit

class GoalsAddScreenViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    weak var delegate: GoalsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 15
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
        warningLabel.isHidden = true
    }
    
    @IBAction func nameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func dateDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func costDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func choiceDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func dropdownButtonAction(_ sender: Any) {
        guard let popupScreenViewController = storyboard?.instantiateViewController(withIdentifier: "GoalsPopupScreenViewController") as? GoalsPopupScreenViewController else { return }
        
        popupScreenViewController.delegate = self
//        popupScreenViewController.dataSource = self
        present(popupScreenViewController, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        guard let source = nameTextField.text, let date = dataTextField.text,let icon = choiceTextField.text, let worth = costTextField.text else{
            warningLabel.isHidden = false
            return
        }
        if !checkData(date: date, worth: worth, icon: icon){
            warningLabel.isHidden = false
            return
        }
        warningLabel.isHidden = true
        let income = IncomeInfo(source: source, date: date, icon: icon, worth: CGFloat(Float(worth)!))
        GoalsContainer.add(element: income)
        delegate?.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    private func checkData(date: String, worth: String,icon: String) -> Bool {
        guard date.count == 10, let dateDay = Int(String(date.dropLast(8))),let dateMonth = Int(String(date.dropFirst(3).dropLast(5))),let dateYear = Int(String(date.dropFirst(6))) else {
            return false
        }
        
        let dateCondition = date.count == 10 && 1 <= dateDay && dateDay <= 31 && 1 <= dateMonth && dateMonth <= 12 && dateYear <= 2021
        let worthCondition = Float(worth) != nil
        let iconCondition = icon.isSingleEmoji
        return dateCondition && worthCondition && iconCondition
    }
    
    func updateChoiceWith(_ choice: String) {
        choiceTextField.text = choice
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        if filtered == string {
            return true
        }
        if string == "." {
            let countdots = textField.text!.components(separatedBy: ".").count - 1
            return countdots <= 0
        }
        return false
    }
}
