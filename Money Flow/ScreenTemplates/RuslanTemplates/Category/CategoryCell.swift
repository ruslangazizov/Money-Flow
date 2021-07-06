//
//  CategoryCell.swift
//  Money Flow
//
//  Created by Руслан on 06.07.2021.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    weak var delegate: PopupCollectionViewController?
    
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
    
    @IBAction func cellButtonAction(_ sender: Any) {
        delegate?.updateChoiceWith(categoryNameLabel.text ?? "")
        delegate?.dismiss(animated: true)
    }

}
