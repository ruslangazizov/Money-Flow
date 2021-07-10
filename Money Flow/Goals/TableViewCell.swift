//
//  TableViewCell.swift
//  Money Flow
//
//  Created by Марат Гатин on 10.07.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var image1View: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ income: IncomeInfo) {
//        cellImage.image = UIImage(named: "Goals")
//        nameLabel.text = "lol"
//        dateLabel.text = "11.11.1111"
//        cellValue.text = "50"
        image1View.image = income.icon.emojiToImage()
        image1View.layer.cornerRadius = 20
        nameLabel.text = income.source
        print(income.date)
        dateLabel.text = income.date
        valueLabel.text = income.getPrettyStringForWorth()
    }

}

extension String {
    func emojiToImage() -> UIImage? {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.init(cgColor: #colorLiteral(red: 0.9018717408, green: 0.902023077, blue: 0.9018517733, alpha: 1)).set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(rect)
        (self as NSString).draw(at: CGPoint(x: 28, y: 24), withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 45)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}



