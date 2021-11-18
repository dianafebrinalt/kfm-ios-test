//
//  FontType.swift
//  WeatherApp
//
//  Created by Diana Febrina Lumbantoruan on 18/11/21.
//

import Foundation
import UIKit

public enum FontType: String {
    case regular = "SFCompactRounded-Regular"
    case medium  = "SFCompactRounded-Medium"
    case semiBold = "SFCompactRounded-Semibold"
    case bold = "SFCompactRounded-Bold"
}

public struct UIFontCustom {
    
    public static func fontName(named: FontType,
                                size: CGFloat) -> UIFont? {
        return UIFont(name: named.rawValue,
                      size: size)
    }
}

