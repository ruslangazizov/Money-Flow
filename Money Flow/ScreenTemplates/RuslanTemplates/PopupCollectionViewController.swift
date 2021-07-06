//
//  PopupCollectionViewController.swift
//  Money Flow
//
//  Created by Руслан on 06.07.2021.
//

import UIKit

private let emojiCellID = "EmojiCell"
private let categoryCellID = "CategoryCell"

class PopupCollectionViewController: UICollectionViewController {
    
    // #warning если нужны эмоджи, то используйте эту строку, если категории - то вторую
    private let (data, cellID, itemsPerRowCount, widthBetweenItemsInLine) = PopupScreenTemplate.getEmojiInformation()
    //private let (data, cellID) = PopupScreenTemplate.getCategoriesInformation()()
    
    weak var delegate: AddScreenViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // #warning если нужны эмоджи, то используйте эту строку, если категории - то вторую
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? EmojiCell ?? EmojiCell()
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CategoryCell ?? EmojiCell()
    
        cell.setupCell(data[indexPath.item])
        cell.delegate = self
    
        return cell
    }
    
    func updateChoiceWith(_ cellData: String) {
        delegate?.updateChoiceWith(cellData)
    }

}

extension PopupCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 25
        let paddingWidth = margin * itemsPerRowCount + widthBetweenItemsInLine * (itemsPerRowCount - 1)
        let totalAvailableWidth = collectionView.frame.width - paddingWidth
        let widthForCell = totalAvailableWidth / itemsPerRowCount
        return CGSize(width: widthForCell, height: widthForCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let margin: CGFloat = 25
        return UIEdgeInsets(top: 15, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        widthBetweenItemsInLine
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        cellID == "EmojiCell" ? 10 : 20
    }
    
}
