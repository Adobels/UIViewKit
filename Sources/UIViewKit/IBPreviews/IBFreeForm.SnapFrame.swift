//
//  IBFreeForm.SnapFrame.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 30/01/2026.
//

import UIKit.UIColor

extension IBFreeForm {

    public struct SnapFrame {
        let title: String
        let size: CGSize
        let tintColor: UIColor
        let borderWidth: CGFloat

        public init(title: String = "\(Self.self)", size: CGSize, tintColor: UIColor? = nil, borderWidth: CGFloat = 1) {
            self.title = title
            self.size = size
            if let tintColor { self.tintColor = tintColor } else {
                self.tintColor = [
                    .systemRed, .systemBlue, .systemGreen, .systemOrange,
                    .systemPurple, .systemPink, .systemTeal, .systemIndigo,
                    .systemYellow, .brown, .cyan, .magenta, .darkGray
                ].randomElement()!
            }
            self.borderWidth = borderWidth
        }
    }

}

public extension IBFreeForm.SnapFrame {
    // MARK: – SE
    static var iPhoneSE1: Self { .init(title: "iPhone SE (1st gen)", size: .init(width: 320, height: 568)) }
    static var iPhoneSE2 : Self { .init(title: "iPhone SE (2nd gen)", size: .init(width: 375, height: 667)) }
    static var iPhoneSE3: Self { .init(title: "iPhone SE (3rd gen)", size: .init(width: 375, height: 667)) }
    // MARK: – Classic
    static var iPhone6: Self { .init(title: "iPhone 6", size: .init(width: 375, height: 667)) }
    static var iPhone6Plus: Self { .init(title: "iPhone 6 Plus", size: .init(width: 414, height: 736)) }
    static var iPhone6s: Self { .init(title: "iPhone 6s", size: .init(width: 375, height: 667)) }
    static var iPhone6sPlus: Self { .init(title: "iPhone 6s Plus", size: .init(width: 414, height: 736)) }
    static var iPhone7: Self { .init(title: "iPhone 7", size: .init(width: 375, height: 667)) }
    static var iPhone7Plus: Self { .init(title: "iPhone 7 Plus", size: .init(width: 414, height: 736)) }
    static var iPhone8: Self { .init(title: "iPhone 8", size: .init(width: 375, height: 667)) }
    static var iPhone8Plus: Self { .init(title: "iPhone 8 Plus", size: .init(width: 414, height: 736)) }
    // MARK: – X family
    static var iPhoneX: Self { .init(title: "iPhone X", size: .init(width: 375, height: 812)) }
    static var iPhoneXS: Self { .init(title: "iPhone XS", size: .init(width: 375, height: 812)) }
    static var iPhoneXSMax: Self { .init(title: "iPhone XS Max", size: .init(width: 414, height: 896)) }
    static var iPhoneXR: Self { .init(title: "iPhone XR", size: .init(width: 414, height: 896)) }
    // MARK: – 11
    static var iPhone11: Self { .init(title: "iPhone 11", size: .init(width: 414, height: 896)) }
    static var iPhone11Pro: Self { .init(title: "iPhone 11 Pro", size: .init(width: 375, height: 812)) }
    static var iPhone11ProMax: Self { .init(title: "iPhone 11 Pro Max", size: .init(width: 414, height: 896)) }
    // MARK: – 12
    static var iPhone12Mini: Self { .init(title: "iPhone 12 mini", size: .init(width: 360, height: 780)) }
    static var iPhone12: Self { .init(title: "iPhone 12", size: .init(width: 390, height: 844)) }
    static var iPhone12Pro: Self { .init(title: "iPhone 12 Pro", size: .init(width: 390, height: 844)) }
    static var iPhone12ProMax: Self { .init(title: "iPhone 12 Pro Max", size: .init(width: 428, height: 926)) }
    // MARK: – 13
    static var iPhone13Mini: Self { .init(title: "iPhone 13 mini", size: .init(width: 375, height: 812)) }
    static var iPhone13: Self { .init(title: "iPhone 13", size: .init(width: 390, height: 844)) }
    static var iPhone13Pro: Self { .init(title: "iPhone 13 Pro", size: .init(width: 390, height: 844)) }
    static var iPhone13ProMax: Self { .init(title: "iPhone 13 Pro Max", size: .init(width: 428, height: 926)) }
    // MARK: – 14
    static var iPhone14: Self { .init(title: "iPhone 14", size: .init(width: 390, height: 844)) }
    static var iPhone14Plus: Self { .init(title: "iPhone 14 Plus", size: .init(width: 428, height: 926)) }
    static var iPhone14Pro: Self { .init(title: "iPhone 14 Pro", size: .init(width: 393, height: 852)) }
    static var iPhone14ProMax: Self { .init(title: "iPhone 14 Pro Max", size: .init(width: 430, height: 932)) }
    // MARK: – 15
    static var iPhone15: Self { .init(title: "iPhone 15", size: .init(width: 393, height: 852)) }
    static var iPhone15Plus: Self { .init(title: "iPhone 15 Plus", size: .init(width: 430, height: 932)) }
    static var iPhone15Pro: Self { .init(title: "iPhone 15 Pro", size: .init(width: 393, height: 852)) }
    static var iPhone15ProMax: Self { .init(title: "iPhone 15 Pro Max", size: .init(width: 430, height: 932)) }
    // MARK: – 16
    static var iPhone16: Self { .init(title: "iPhone 16", size: .init(width: 393, height: 852)) }
    static var iPhone16Plus: Self { .init(title: "iPhone 16 Plus", size: .init(width: 430, height: 932)) }
    static var iPhone16Pro: Self { .init(title: "iPhone 16 Pro", size: .init(width: 402, height: 874)) }
    static var iPhone16ProMax: Self { .init(title: "iPhone 16 Pro Max", size: .init(width: 440, height: 956)) }
    // MARK: – 17
    static var iPhone17: Self { .init(title: "iPhone 17", size: .init(width: 402, height: 874)) }
    static var iPhone17Pro: Self { .init(title: "iPhone 17 Pro", size: .init(width: 402, height: 874)) }
    static var iPhone17ProMax: Self { .init(title: "iPhone 17 Pro Max", size: .init(width: 440, height: 956)) }
    // MARK: – Air
    static var iPhoneAir: Self { .init(title: "iPhone Air", size: .init(width: 420, height: 912)) }
}
