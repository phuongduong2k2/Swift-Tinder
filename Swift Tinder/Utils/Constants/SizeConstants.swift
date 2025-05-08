//
//  SizeConstants.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 8/5/25.
//

import SwiftUI
import Foundation

struct SizeConstants {
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    static var screenCutOff: CGFloat {
        UIScreen.main.bounds.width / 2 * 0.8
    }
}
