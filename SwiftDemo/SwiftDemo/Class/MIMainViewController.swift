//
//  MIMainViewController.swift
//  SwiftDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

import UIKit

class MIMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MICollectionViewBubbleLayoutDelegate {
    
    @IBOutlet private var collVData: UICollectionView!
    
    private let kItemPadding = 10
    private var arrData: [Item] = Item.mockItems
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //...UICollectionView setup
        let bubbleLayout = MICollectionViewBubbleLayout()
        bubbleLayout.minimumLineSpacing = 6.0
        bubbleLayout.minimumInteritemSpacing = 6.0
        bubbleLayout.delegate = self 
        collVData.setCollectionViewLayout(bubbleLayout, animated: false)
    }  
    
    // MARK: -
    // MARK: - UICollectionView Delegate & Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let indentifier = "MIBubbleCollectionViewCell"
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as? MIBubbleCollectionViewCell {
            cell.configure(with: arrData[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrData[indexPath.row].isSelected.toggle()
        collectionView.reloadData()
    }
    
    
    // MARK: -
    // MARK: - MICollectionViewBubbleLayoutDelegate
    
    func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize {
        
        let title = arrData[indexPath.row].name
        var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15)!])
        size.width = CGFloat(ceilf(Float(size.width + 28 + CGFloat(kItemPadding * 2))))
        size.height = 40

        //...Checking if item width is greater than collection view width then set item width == collection view width.
        if size.width > collectionView.frame.size.width {
            size.width = collectionView.frame.size.width
        }
        return size
    }
}
