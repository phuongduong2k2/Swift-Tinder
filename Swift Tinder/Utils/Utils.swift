//
//  Utils.swift
//  Swift Tinder
//
//  Created by Duong Phuong on 11/5/25.
//
import SwiftUI
import Foundation

struct Utils {
    static func rgb(_ red: Double, _ green: Double, _ blue: Double, _ opacity: Double = 255) -> Color {
        return Color(red: red/255, green: green/255, blue: blue/255, opacity: opacity)
    }
}
