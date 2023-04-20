//
//  MIMainViewController.swift
//  SwiftDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

import UIKit

protocol ItemAction: AnyObject {
    func onCloseButtonTapped(with item: Item? ,sender: UIButton)
}

final class MIMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,MICollectionViewBubbleLayoutDelegate {
    
    @IBOutlet private var collVData: UICollectionView!
    @IBOutlet private var buttonDone: UIButton!
    @IBOutlet private var buttonAddMoreData: UIButton!
    @IBOutlet private var viewAddMoreData: UIView!
    @IBOutlet private var textfiledEnterDetails: UITextField!
    
    private let kItemPadding = 10
    private var arrData: [DataCollection] = DataCollection.sectionItems {
        didSet {
            collVData.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //...UICollectionView setup
        
        let bubbleLayout = MICollectionViewBubbleLayout()
        bubbleLayout.minimumLineSpacing = 6.0
        bubbleLayout.minimumInteritemSpacing = 0
        bubbleLayout.horizontalAlignment = .leading
        collVData.setCollectionViewLayout(bubbleLayout, animated: false)
        bubbleLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
    }
    // MARK: -
    // MARK: - IBACTION METHODS
    @IBAction func addmoreButtonTapped(_ sender: Any) {
        buttonAddMoreData.isHidden = true
        viewAddMoreData.isHidden = false
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
        if(self.textfiledEnterDetails.text?.isEmpty == false){
            arrData[sender.tag].add(newItem: Item(id:  UUID(), name: self.textfiledEnterDetails.text ?? "",image: ItemResource.chocolate.image,
                                                  color: .orange,
                                                  isSelected: false))
        }
        collVData.reloadData()
        self.textfiledEnterDetails.text = ""
        self.textfiledEnterDetails.resignFirstResponder()
    }
    
    // MARK: -
    // MARK: - UICollectionView Delegate & Datasource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData[section].item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let indentifier = "MIBubbleCollectionViewCell"
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as? MIBubbleCollectionViewCell {
            cell.configure(with: arrData[indexPath.section].item[indexPath.row])
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrData[indexPath.section].item[indexPath.row].isSelected.toggle()
    }
    
    // MARK: -
    // MARK: - MICollectionViewBubbleLayoutDelegate
    
    func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize {
        
        let title = arrData[indexPath.section].item[indexPath.row].name
        var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15)!])
        let closeButtonWidth = 20.0
        let imageWidth = 20.0
        let spacing = 18.0
        let totalWidth = Float(size.width + closeButtonWidth + imageWidth + spacing + CGFloat(kItemPadding * 2))
        size.width = CGFloat(ceilf(totalWidth))
        size.height = 40

        //...Checking if item width is greater than collection view width then set item width == collection view width.
        if size.width > collectionView.frame.size.width {
            size.width = collectionView.frame.size.width
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collVData.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
            headerView.lblTitleText.text = arrData[indexPath.section].title
            headerView.lblTitleText.sizeToFit()
            return headerView
            
            
        default:
            return UICollectionReusableView()
            
        }
    }
}

extension MIMainViewController: ItemAction {
    
    func onCloseButtonTapped(with item: Item?,sender:UIButton) {
        
        guard item != nil else { return }
        guard let indexPath = self.collVData.indexPathForView(view: sender) else { return }
        arrData[(indexPath.section)].remove(newItem: item!)
    }
}
extension MIMainViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - Collection View Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if arrData[section].item.count == 0 {
            return CGSize(width: collectionView.bounds.width, height: 0)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 80.0)
        }
    }
    
}
