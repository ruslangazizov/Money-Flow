//
//  StatisticsTableViewCell.swift
//  Money Flow
//
//  Created by Алия Гиниятова on 08.07.2021.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
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
    
    
    
    func setData(expense: LabelledSegment, overall: CGFloat) {
    
        valueLabel.text = "\(Int((expense.value/overall)*100))%  (\(Int(expense.value))$)"
        
        if expense.name == "🚘" {
            categoryNameLabel.text = "Транспорт"
            categoryImage.image = UIImage(named: "Транспорт")
        }
        if expense.name == "🛍" {
            categoryNameLabel.text = "Шоппинг"
            categoryImage.image = UIImage(named: "Шоппинг")
        }
        if expense.name == "🍌" {
            categoryNameLabel.text = "Продукты"
            categoryImage.image = UIImage(named: "Продукты")
        }
        if expense.name == "💊" {
            categoryNameLabel.text = "Здоровье"
            categoryImage.image = UIImage(named: "Здоровье")
        }
        if expense.name == "🍽" {
            categoryNameLabel.text = "Кафе"
            categoryImage.image = UIImage(named: "Кафе")
        }
        if expense.name == "🏠" {
            categoryNameLabel.text = "Дом"
            categoryImage.image = UIImage(named: "Дом")
        }
        
        
    }

}
