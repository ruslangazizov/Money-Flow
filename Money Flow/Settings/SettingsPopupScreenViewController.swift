//
//  SettingsPopupScreenViewController.swift
//  Money Flow
//
//  Created by Руслан on 07.07.2021.
//

import UIKit

class SettingsPopupScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: LimitsViewController?
    
    private let (data, cellID, itemsPerRowCount, widthBetweenItemsInLine) = PopupScreenTemplate.getCategoriesInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "SettingsCategoryCell", bundle: nil), forCellWithReuseIdentifier: "SettingsCategoryCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateChoiceWith(_ cellData: String) {
        delegate?.updateChoiceWith(cellData)
    }

}

extension SettingsPopupScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCategoryCell", for: indexPath) as? SettingsCategoryCell ?? SettingsCategoryCell()
        
        if let cell = cell as? SettingsCategoryCell {
            cell.setupCell(data[indexPath.item])
            cell.delegate = self
        }
    
        return cell
    }
    
}

extension SettingsPopupScreenViewController: UICollectionViewDelegate {
    
}

extension SettingsPopupScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = cellID == "EmojiCell" ? 15 : 25
        let paddingWidth = margin * 2 + widthBetweenItemsInLine * (itemsPerRowCount - 1)
        let totalAvailableWidth = collectionView.frame.width - paddingWidth
        let widthForCell = totalAvailableWidth / itemsPerRowCount
        return CGSize(width: widthForCell, height: widthForCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let margin: CGFloat = cellID == "EmojiCell" ? 15 : 25
        let topMargin: CGFloat = cellID == "EmojiCell" ? 0 : 15
        return UIEdgeInsets(top: topMargin, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        widthBetweenItemsInLine
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        cellID == "EmojiCell" ? 5 : 20
    }
    
}
