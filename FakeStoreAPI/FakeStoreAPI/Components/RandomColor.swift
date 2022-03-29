//
//  RandomColor.swift
//  PageViewController
//
//  Created by Emre Alpago on 29.03.2022.
//

import Foundation
import UIKit


func randomCGFloat() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
}

func randomColor() -> UIColor {
    return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
}
