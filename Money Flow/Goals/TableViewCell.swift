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
    @IBOutlet weak var activeSlider: UISlider!
    @IBOutlet var label: UILabel!
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        let value = sender.value
        label.text = "\(value)%"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ income: IncomeInfo) {
        image1View.image = income.icon.emojiToImage()
        image1View.layer.cornerRadius = 20
        nameLabel.text = income.source
        dateLabel.text = income.date
        valueLabel.text = income.getPrettyStringForWorth()
    }

}
