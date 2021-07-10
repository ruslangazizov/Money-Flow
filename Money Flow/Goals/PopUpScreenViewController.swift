//
//  PopupScreenViewController.swift
//  Money Flow
//
//  Created by Руслан on 07.07.2021.
//
import UIKit

class PopupScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: AddScreenViewController?
    
  
    private let (data, cellID, itemsPerRowCount, widthBetweenItemsInLine) = PopupScreenTemplate.getEmojiInformation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateChoiceWith(_ cellData: String) {
        delegate?.updateChoiceWith(cellData)
    }

}

extension PopupScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if cellID == "EmojiCell" {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? EmojiCell ?? EmojiCell()
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CategoryCell ?? CategoryCell()
        }
        
        // #warning если нужны эмоджи, то используйте этот if, если категории - то второй if
        if let cell = cell as? EmojiCell {
            cell.setupCell(data[indexPath.item])
            cell.delegate = self
        } else if let cell = cell as? CategoryCell {
//            cell.setupCell(data[indexPath.item])
//            cell.delegate = self
        }
    
        return cell
    }
    
}

extension PopupScreenViewController: UICollectionViewDelegate {
    
}

extension PopupScreenViewController: UICollectionViewDelegateFlowLayout {
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
