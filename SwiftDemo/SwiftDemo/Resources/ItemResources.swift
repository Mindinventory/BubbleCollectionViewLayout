//
//  ItemResources.swift
//  SwiftDemo
//
//  Created by Parth Gohel on 22/06/22.
//  Copyright © 2022 Parth Gohel. All rights reserved.
//

import UIKit

enum ItemResource {

    case chocolate

    var image: UIImage {
        switch self {
        case .chocolate:
            return UIImage(named: "chocolate") ?? UIImage()
        }
    }
}
