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
    
    weak var delegate: ExpensesViewController?
    
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

    @IBAction func categoryButtonAction(_ sender: UIButton) {
        guard let detailViewController = delegate?.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailViewController.backgroundColor = backgroundColor
        detailViewController.categoryName = categoryNameLabel.text
        delegate?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
