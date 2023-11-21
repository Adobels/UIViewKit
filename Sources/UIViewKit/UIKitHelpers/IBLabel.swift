//
//  IBPreviewLabel.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 12/11/2023.
//

#if DEBUG

import UIKit

public class IBPreviewLabel: UILabel {

    public convenience init(_ text: String) {
        self.init(frame: .zero)
        self.text = text
    }

}

#endif
