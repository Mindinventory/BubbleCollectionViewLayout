//
//  MIBubbleCollectionViewCell.swift
//  SwiftDemo
//
//  Created by mac-0007 on 05/12/17.
//  Copyright © 2017 Jignesh-0007. All rights reserved.
//

import UIKit

final class MIBubbleCollectionViewCell: UICollectionViewCell {

    @IBOutlet var lblTitle:UILabel!
    @IBOutlet weak var itemImageView: RoundImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    weak var delegate: ItemAction?
    var item: Item?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    func configure(with item: Item) {

        self.item = item
        lblTitle.text = item.name
        lblTitle.textColor = item.isSelected ? .white : .black
        itemImageView.image = item.image
        layer.borderColor = item.color.cgColor
        backgroundColor = item.color.withAlphaComponent(item.isSelected ? 1: 0.2)
        closeButton.tintColor = item.isSelected ? .white : item.color
    }
}

extension MIBubbleCollectionViewCell {
    
    @IBAction func onCloseButtonTapped(_ sender: UIButton) {
        delegate?.onCloseButtonTapped(with: item, sender: sender)
    }
}
