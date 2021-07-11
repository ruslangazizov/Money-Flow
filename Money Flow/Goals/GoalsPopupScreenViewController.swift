//
//  GoalsPopupScreenViewController.swift
//  Money Flow
//
//  Created by Руслан on 07.07.2021.
//
import UIKit

class GoalsPopupScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: GoalsAddScreenViewController?
    
    private let (data, cellID, itemsPerRowCount, widthBetweenItemsInLine) = PopupScreenTemplate.getEmojiInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "GoalsEmojiCell", bundle: nil), forCellWithReuseIdentifier: "GoalsEmojiCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func updateChoiceWith(_ cellData: String) {
        delegate?.updateChoiceWith(cellData)
    }

}

extension GoalsPopupScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoalsEmojiCell", for: indexPath) as? GoalsEmojiCell ?? GoalsEmojiCell()
        
        cell.setupCell(data[indexPath.item])
        cell.delegate = self
    
        return cell
    }
    
}

extension GoalsPopupScreenViewController: UICollectionViewDelegate {
    
}

extension GoalsPopupScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 15
        let paddingWidth = margin * 2 + widthBetweenItemsInLine * (itemsPerRowCount - 1)
        let totalAvailableWidth = collectionView.frame.width - paddingWidth
        let widthForCell = totalAvailableWidth / itemsPerRowCount
        return CGSize(width: widthForCell, height: widthForCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let margin: CGFloat = 15
        let topMargin: CGFloat = 0
        return UIEdgeInsets(top: topMargin, left: margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        widthBetweenItemsInLine
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
}
