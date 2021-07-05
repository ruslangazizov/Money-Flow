//
//  ExpensesViewController.swift
//  Money Flow
//
//  Created by Руслан on 04.07.2021.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var addExpenseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView! {
        didSet {
            leftAndRigthMargin = addExpenseLabel.frame.origin.x
        }
    }
    
    private let widthBetweenItemsInLine: CGFloat = 25
    private var leftAndRigthMargin: CGFloat?
    
    let categories: [Category] = [Category(name: "Транспорт", image: UIImage(named: "Car") ?? UIImage(), backgroundColor: #colorLiteral(red: 0.9731522202, green: 0.9238572717, blue: 0.9159588218, alpha: 1)),
                                  Category(name: "Шоппинг", image: UIImage(named: "Bags") ?? UIImage(), backgroundColor: #colorLiteral(red: 0.9981009364, green: 0.963594377, blue: 0.9121462703, alpha: 1)),
                                  Category(name: "Продукты", image: UIImage(named: "Banana") ?? UIImage(), backgroundColor: #colorLiteral(red: 0.8349118829, green: 0.9203750491, blue: 0.9531015754, alpha: 1)),
                                  Category(name: "Здоровье", image: UIImage(named: "Pill") ?? UIImage(), backgroundColor: #colorLiteral(red: 0.939599514, green: 0.9696645141, blue: 0.89979285, alpha: 1)),
                                  Category(name: "Кафе", image: UIImage(named: "Cutlery") ?? UIImage(), backgroundColor: #colorLiteral(red: 0.9153895974, green: 0.9056152701, blue: 0.9657009244, alpha: 1)),
                                  Category(name: "Дом", image: UIImage(named: "House") ?? UIImage(), backgroundColor: #colorLiteral(red: 0.9192375541, green: 0.9743735194, blue: 0.9603385329, alpha: 1))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
    }
    
}

extension ExpensesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell ?? CategoryCollectionViewCell()
        cell.setupCell(categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRowCount: CGFloat = 2
        let margin: CGFloat = leftAndRigthMargin ?? 25
        let paddingWidth = margin * itemsPerRowCount + widthBetweenItemsInLine * (itemsPerRowCount - 1)
        let totalAvailableWidth = collectionView.frame.width - paddingWidth
        let widthForCell = totalAvailableWidth / itemsPerRowCount
        return CGSize(width: widthForCell, height: widthForCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let margin: CGFloat = leftAndRigthMargin ?? 25
        return UIEdgeInsets(top: 0, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        widthBetweenItemsInLine
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
}
