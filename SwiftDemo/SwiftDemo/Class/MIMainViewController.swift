//
//  MIMainViewController.swift
//  SwiftDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

import UIKit

protocol ItemAction: AnyObject {
    func onCloseButtonTapped(with item: Item?)
}

final class MIMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, MICollectionViewBubbleLayoutDelegate {
    
    @IBOutlet private var collVData: UICollectionView!
    @IBOutlet private var buttonDone: UIButton!
    @IBOutlet private var buttonAddMoreData: UIButton!
    @IBOutlet private var viewAddMoreData: UIView!
    @IBOutlet private var textfiledEnterDetails: UITextField!

    private let kItemPadding = 10
    private var arrData: [Item] = Item.mockItems {
        didSet {
            collVData.reloadData()
        }
    }
    
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
    // MARK: - IBACTION METHODS
    @IBAction func addmoreButtonTapped(_ sender: Any) {
        buttonAddMoreData.isHidden = true
        viewAddMoreData.isHidden = false
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        if(self.textfiledEnterDetails.text?.isEmpty == false){
            arrData.append(Item(id:  UUID(), name: self.textfiledEnterDetails.text ?? "",image: ItemResource.chocolate.image,
                                color: .orange,
                                isSelected: false))
            self.textfiledEnterDetails.resignFirstResponder()
            collVData.reloadData()
            self.textfiledEnterDetails.text = ""
        }
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
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        arrData[indexPath.row].isSelected.toggle()
    }

    // MARK: -
    // MARK: - MICollectionViewBubbleLayoutDelegate
    
    func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize {
        
        let title = arrData[indexPath.row].name
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
}

extension MIMainViewController: ItemAction {

    func onCloseButtonTapped(with item: Item?) {

        guard let safeItem = item else { return }
        arrData = arrData.filter({$0.id != safeItem.id})
    }
}
