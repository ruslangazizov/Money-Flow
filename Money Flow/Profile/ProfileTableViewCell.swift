//
//  ProfileTableViewCell.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 06.07.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func settData(income: IncomeInfo) {
        nameLabel.text = income.source
        dateLabel.text = income.date
        valueLabel.text = income.getPrettyStringForWorth()
    
        categoryImage.image = UIImage(named: "Прибыль")
        
    }
    func setData(expense: ExpenseInfo) {
        
        nameLabel.text = expense.categoryName
        dateLabel.text = expense.date
        valueLabel.text = expense.getPrettyStringForCost()
    
        categoryImage.image = UIImage(named: expense.categoryName)
        
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
