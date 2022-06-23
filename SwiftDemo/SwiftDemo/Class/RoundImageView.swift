//
//  RoundImageView.swift
//  SwiftDemo
//
//  Created by Parth Gohel on 22/06/22.
//  Copyright © 2022 Parth Gohel. All rights reserved.
//

import UIKit

final class RoundImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height/2
    }
}
