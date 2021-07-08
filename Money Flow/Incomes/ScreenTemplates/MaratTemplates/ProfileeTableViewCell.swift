//
//  ProfileeTableViewCell.swift
//  Money Flow
//
//  Created by Руслан on 07.07.2021.
//

import UIKit

class ProfileeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ expense: ExpenseInfo) {
        cellImage.image = expense.icon.emojiToImage()
        cellImage.layer.cornerRadius = 20
        nameLabel.text = expense.name
        dateLabel.text = expense.date
        cellValue.text = expense.getPrettyStringForCost()
    }

}
