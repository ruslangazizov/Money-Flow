//
//  CategoryCollectionViewCell.swift
//  Money Flow
//
//  Created by Руслан on 05.07.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ category: Category) {
        imageView.image = category.image
        categoryNameLabel.text = category.name
        backgroundColor = category.backgroundColor
        backgroundImageView.layer.cornerRadius = 35
        layer.cornerRadius = 15
    }

    @IBAction func categoryButtonAction(_ sender: Any) {
        // создать экземпляр нового контроллера и модально перейти к нему
    }
}
